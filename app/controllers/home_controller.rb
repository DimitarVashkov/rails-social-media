class HomeController < ApplicationController
  def index
    if user_signed_in?
    @feed = current_user.feed(current_user)
    end

  end
end
