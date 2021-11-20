class UsersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @user = User.find(params[:id])
  end
end
