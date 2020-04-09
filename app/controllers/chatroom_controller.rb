class ChatroomController < ApplicationController
  before_action :require_user
  def index
    @messages = Message.newest
    @message = Message.new
  end
end
