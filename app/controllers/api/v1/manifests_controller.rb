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

  def clone
    byebug
    @manifest = Manifest.find(params[:manifestId])
    if @manifest
      @clonedManifest = @manifest.dup
      @clonedManifest.user_id = current_user.id
      current_user.manifests << @clonedManifest
      @clonedManifest.items = @manifest.items
      render json: @clonedManifest
    else
      render json: {error: 'what the fuck is this'}
    end
  end

  private

  def manifests_params
    params.require(:manifest).permit(:title, :limit, :description, :user_id)
  end
end
