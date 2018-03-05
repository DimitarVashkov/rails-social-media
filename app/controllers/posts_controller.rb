class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  def mine
    @user = User.find(current_user.id)
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_url
    else
      render root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
