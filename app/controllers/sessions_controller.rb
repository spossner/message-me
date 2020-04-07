class SessionsController < ApplicationController
  def new

  end

  def create
    session[:user_id] = 1
    flash[:success] = "Successfully logged in"
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
