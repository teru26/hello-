class UsersController < ApplicationController
  def make_friend
    current_user.connect_users.find_or_create_by(to_user: User.find(params[:id]))
    current_user.chats.find_or_create_by(user2: User.find(params[:id]))
    redirect_to root_path
  end
end
