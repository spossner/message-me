class ChatroomController < ApplicationController
  def index
    @messages = Message.all if logged_in?
  end
end
