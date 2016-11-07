module SessionsHelper
  #login user
  def logging_in(user)
    session[:user_id] = user.id
  end

  def remember_user(user)
    user.remember_user
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def loggedin_user
    if (user_id = session[:user_id])
      @loggedin_user = @loggedin_user || User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        logging_in user
        @loggedin_user = user
      end
    end
  end

#is there a user logged in?
  def logged_in?
    !loggedin_user.nil?
  end

  def forget_user(user)
    user.forget_user
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logging_out
    forget_user(loggedin_user)
    session.delete(:user_id)
    @loggedin_user = nil
  end
end
