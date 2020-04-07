class ChatroomController < ApplicationController
  def index
    @messages = @current_user.messages if logged_in?
  end
end
