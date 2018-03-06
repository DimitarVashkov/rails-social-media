class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy

  def index
    @friends = current_user.friends
  end

  def destroy
    @user = current_user
    @user.remove_friend(@user, @friend)
    redirect_to friends_url
  end

  private

  def set_friend
    @friend = current_user.friends.find(params[:id])
  end
end
