# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if /^\w*$/ =~ data['message']
      Message.create! content: data['message'], user: current_user, chat_id: data['chat_id']
    end
  end
end
