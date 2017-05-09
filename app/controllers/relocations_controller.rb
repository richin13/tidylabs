class RelocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_relocation, only: [:show, :edit, :update]
  before_action :find_asset, only: [:index, :new, :create]

  def index
    @current_location = @asset.area
    @relocations = @asset.relocations.order('created_at DESC')
  end

  def new
    @relocation = Relocation.new
  end

  def create
    @relocation = @asset.relocations.build(relocation_params)

    if @relocation.save && update_asset_location
      flash[:success] = "Activo reubicado satisfactoriamente"
      redirect_to asset_relocations_url
    else
      render :new
    end
  end

  private
  
  def relocation_params
    params.require(:relocation).permit(:reason, :from_area_id, :to_area_id)
  end

  def find_relocation
    @relocation = Relocation.find(params[:id])
  end

  def find_asset
    @asset = Asset.find(params[:asset_id])
  end

  def update_asset_location
    @asset.update_attribute(:area, @relocation.to_area)
  end
end
