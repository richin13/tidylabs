class IdentificationCodesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_id_code, only: :show
  before_action :find_asset

  def index
    @id_code = @asset.identification_code
  end

  def print
    render layout: false
  end

  private

  def find_id_code
    @id_code = IdentificationCode.find(params[:id])
  end

  def find_asset
    @asset = Asset.find(params[:asset_id])
  end
end
