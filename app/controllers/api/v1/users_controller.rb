class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @item = Item.create(item_params)
    if @item
      render json: @item
    else
      render json: @item.errors.full_messages
    end
  end

  def update
    @item = Item.update(item_params)
    render json: @item
  end

  def destroy
    @item = Item.find_by(item_params)
    @item.destroy
  end

  def signup

  end

  def login

  end

  private

  def item_params
    params.require(:item).permit(:username, :password, :password_digest)
  end
end
