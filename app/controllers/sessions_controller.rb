class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new

  end

  def create
    # user = User.find_by(username: params[:session][:username])
    user = User.where("lower(username) = ?", params[:session][:username].downcase).first
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in"
      redirect_to root_path
    else
        flash.now[:error] = ["Login credentials are wrong", "Please check your login data"]
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = "Successfully logged out"
    redirect_to login_path
  end

  private
  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in. Not #{@current_user.username}? #{view_context.link_to'Switch to your account.', logout_path, method: :delete}"
      redirect_to root_path
    end
  end
end
