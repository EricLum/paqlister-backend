class Api::V1::ItemsController < ApplicationController

  def index
    @items = Item.all
    render json: @items
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

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :brand, :image)
  end

end
