class Admin::UsersController < ApplicationController
  def index
    authorize User
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.invite!
      redirect_to admin_users_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
