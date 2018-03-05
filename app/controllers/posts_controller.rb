class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  def mine
    @user = User.find(current_user.id)
  end
end
