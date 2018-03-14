class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages
  end
end
