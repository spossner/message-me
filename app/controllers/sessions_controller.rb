class SessionsController < ApplicationController
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
    redirect_to root_path
  end



end
