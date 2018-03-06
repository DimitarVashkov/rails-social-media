class UsersController < ApplicationController
  def index
    @user = current_user
  end
  
  def all_users
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
