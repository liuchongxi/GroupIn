class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      logging_in user
      remember_user user
      redirect_to root_url
    else
      flash.now[:error] = "Wrong email or password"
      render 'new'
    end
  end

  def destroy
    logging_out if loggedin_user?
    redirect_to root_url
  end
end
