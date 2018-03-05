class HomeController < ApplicationController
  def index
    if user_signed_in?
    @feed = User.find(current_user.id).posts.all.order('posts.updated_at DESC').
        includes(:comments).order('comments.updated_at DESC')
    end

  end
end
