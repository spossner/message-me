class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from CHATROOM_CHANNEL_NAME
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
