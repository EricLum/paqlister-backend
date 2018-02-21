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
    @manifest_items = ManifestItems.update(manifest_items_params)
    render json: @manifest_items
  end

  def destroy
    @manifest_items = ManifestItems.find_by(manifest_items_params)
    @manifest_items.destroy
  end

  private

  def manifest_items_params
    params.require(:manifest_item).permit(:manifest_id, :item_id)
  end
end
