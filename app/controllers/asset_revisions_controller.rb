# Use only as API endpoint
class AssetRevisionsController < ApplicationController
  acts_as_token_authentication_handler_for User
  skip_before_action :verify_authenticity_token

  before_action :set_asset_revision, only: :destroy

  def create
    revision = Revision.find(asset_revision_params[:revision])
    asset = Asset.find(asset_revision_params[:asset])

    @asset_revision = AssetRevision.new(asset: asset, revision: revision)

    respond_to do |format|
      if @asset_revision.save
        format.json { render :show, status: :created, location: @asset_revision }
      else
        format.json { render json: @asset_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @asset_revision.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_asset_revision
      @asset_revision = AssetRevision.find(params[:id])
    end

    def asset_revision_params
      params.require(:asset_revision).permit(:asset, :revision)
    end
end
