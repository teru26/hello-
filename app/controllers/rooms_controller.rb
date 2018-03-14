class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @messages = Message.all
    @users = User.where.not(id: current_user.id)
  end
end
