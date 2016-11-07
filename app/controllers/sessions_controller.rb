class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      logging_in user
      flash[:notice]="login successfully"
      remember_user user
      params[:session][:remember_me] == '1' ? remember_user(user) : forget_user(user)
      redirect_to root_url
    else
      flash.now[:error] = "Wrong email or password"
      render 'new'
    end
  end

  def destroy
    logging_out if logged_in?
    redirect_to root_url
  end
end
