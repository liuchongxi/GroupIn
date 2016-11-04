module SessionsHelper
  #login user
  def log_in(user)
    session[:user_id] = user.id
  end

  def loggedin_user
    @loggedin_user = @loggedin_user || User.find_by(id: session[:user_id])
  end
end
