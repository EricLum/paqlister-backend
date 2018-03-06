class Api::V1::ManifestsController < ApplicationController

  def index
    @manifests = Manifest.all
    render json: @manifests
  end

  def mymanifests
    @user = current_user
    render json: @user.manifests
  end

  def create
    @manifests = Manifest.create(manifests_params)
    if @manifests
      render json: @manifests
    else
      render json: @manifests.errors.full_messages
    end
  end

  def update
    @manifests = Manifest.update(manifests_params)
    render json: @manifests
  end

  def destroy
    @manifests = Manifest.find_by(manifests_params)
    @manifests.destroy
  end

  def getManifestItems
    @manifest = Manifest.find(params[:manifestId])
    if @manifest
      render json: @manifest.items
    end
  end

  private

  def manifests_params
    params.require(:manifest).permit(:title, :limit, :description, :user_id)
  end
end
