class CommentsController < ApplicationController
 def create
   @comment = Comment.new(comment_params)
   @comment.user_id = current_user.id
   if @comment.save
     redirect_to root_url
   else
     redirect_to profile_url
   end
 end

 def comment_params
   params.require(:comment).permit(:post_id, :content)
 end

end
