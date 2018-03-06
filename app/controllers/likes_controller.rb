class LikesController < ApplicationController
  def create
    like = Like.new(user_id: current_user.id)
    like.likeable = if like_params[:post_id]
                      Post.find(like_params[:post_id])
                    else
                      Comment.find(like_params[:comment_id])
                    end
    like.save
    redirect_to root_url
  end

  def destroy
    if like_params[:post_id]
      post = Post.find(like_params[:post_id])
      post.likes.where('user_id = ?',current_user.id).take.destroy
    else
      comment = Comment.find(like_params[:comment_id])
      comment.likes.where('user_id = ?',current_user.id).take.destroy
    end
    redirect_to root_url
  end

  def like_params
    params.require(:like).permit(:post_id, :comment_id)
  end
end
