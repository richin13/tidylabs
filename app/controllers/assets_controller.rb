class AssetsController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :authenticate_user!
  before_action :find_asset, :except => [:new, :create, :index]
  skip_before_action :verify_authenticity_token, :only => [:update]

  def index
    @assets = Asset.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @asset.build_details

    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @asset = Asset.new
  end

  def edit
  end

  def create
    @asset = Asset.new(asset_params)

    if @asset.save
      redirect_to asset_url(@asset), notice: 'Activo creado correctamente'
    else
      render :new
    end
  end

  def update
    asset_update_params = asset_params
    image = Paperclip.io_adapters.for(params[:photo])
    image.original_filename = 'asset_image_from_mobile.png'
    asset_update_params[:photo] = image

    if @asset.update(asset_update_params)
      respond_to do |format|
        format.html { redirect_to asset_url(@asset), notice: 'Activo actualizado correctamente' }
        format.json { render :show }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render :show, status: 400 }
      end
    end
  end

  def destroy
    @asset.destroy # subject to further discussion
    redirect_to assets_path
  end

  private

  def find_asset
    @asset = Asset.find(params[:id])
  end

  def asset_params
    if params.has_key? :plated_asset
      params[:asset] = params.delete :plated_asset
    elsif params.has_key? :unplated_asset
      params[:asset] = params.delete :unplated_asset
    end

    params.require(:asset).permit(:type, :plate_number, :quantity, :description, :serial_number, :area_id, :photo,
                                  :status, :has_warranty, :has_tech_details, :has_security_details, :has_network_details,
                                  :asset_category_id)
  end

end
