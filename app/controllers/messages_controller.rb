class MessagesController < ApplicationController
  before_action :require_user # for all actions

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast CHATROOM_CHANNEL_NAME,
                                   message: render(partial: 'message', locals: {message: message})
      head :ok
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end