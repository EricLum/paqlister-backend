class Api::V1::ManifestItemsController < ApplicationController
  def index
    @manifest_manifest_itemss = ManifestItems.all
    render json: @manifest_manifest_itemss
  end

  def create
    @manifest_items = ManifestItems.create(manifest_items_params)
    if @manifest_items
      render json: @manifest_items
    else
      render json: @manifest_items.errors.full_messages
    end
  end

  def update

    @manifest_item = ManifestItem.find_by(manifest_id: params[:manifestItemId], item_id: params[:itemId])
    
    @manifest_item.update(left_position: params[:left_position], top_position: params[:top_position])

    render json: @manifest_item
  end

  def destroy
    @manifest_items = ManifestItems.find_by(manifest_items_params)
    @manifest_items.destroy
  end

  def getManifestItemsPositions
    @manifest_items = ManifestItem.where(manifest_id: params[:manifestId])
    if @manifest_items
      render json: @manifest_items
    end
  end

  private

  def manifest_items_params
    params.require(:manifest_item).permit(:manifest_id, :item_id, :left_position, :top_position)
  end
end
