class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @ideas = Idea.where(user_id: @user.id)
    @idea = Idea.new
  end

  def index
    @users = User.where.not(id: current_user.id)
  end
  
  def followings
     user = User.find(params[:user_id])
     @users = user.followings
  end
  
  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
