class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    if @user
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  def update
    @user = User.update(user_params)
    render json: @user
  end

  def destroy
    @user = User.find_by(user_params)
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end
end
