class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [:index, :create]

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def create
    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.new(friend: friend)
    if @friend_request.save
      redirect_to user_url(friend.id)
    else
      redirect_to root_url
    end
  end

  def update
    @friend_request.accept
    head :no_content
  end

  def destroy
    FriendRequest.find(@friend_request.id).destroy
    redirect_to user_url(@friend_request.friend_id)
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.where('friend_id like ?',params[:id]).take
  end
end
