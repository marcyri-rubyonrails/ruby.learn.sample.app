class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      # Create an error message
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  # Logout user
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
