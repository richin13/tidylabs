class AssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_asset, :except => [:new, :create, :index]

  def index
    @assets = Asset.all
  end

  def show
  end

  def new
    @asset = Asset.build_asset
  end

  def edit
  end

  def create
    @asset = Asset.new(asset_params)

    if @asset.save
      # Maybe generate qr here?
      @asset.generate_id_code
      redirect_to asset_url(@asset), notice: 'Activo creado correctamente'
    else
      render :new
    end
  end

  def update
    if @asset.update(asset_params)
      redirect_to asset_url(@asset), notice: 'Activo actualizado correctamente'
    else
      render :edit
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
                                  :asset_category_id,
                                  :warranty_attributes => [:purchase_date, :month_period, :agent_name, :agent_phone],
                                  :technical_detail_attributes => [:cpu, :ram, :hdd, :os, :other],
                                  :security_detail_attributes => [:username, :password],
                                  :network_detail_attributes => [:ip, :mask, :gateway, :dns])
  end
end
