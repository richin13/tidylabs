class NetworkDetailsController < ApplicationController
  before_action :find_network_detail, except: [:new, :create]
  before_action :find_asset, except: [:update, :destroy]

  def new
    @network_details = NetworkDetail.new
  end

  def create
    @network_details = NetworkDetail.create(network_details_params)
    @network_details.asset = @asset

    if @network_details.save
      @network_details.asset.has_network_details!
      redirect_to asset_path(@asset), notice: 'Detalles de red guardados correctamente'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @network_details.update(network_details_params)
      redirect_to asset_url(@network_details.asset_id), notice: 'Detalles de red actualizados correctamente'
    else
      render :edit
    end
  end

  def destroy
    @network_details.asset.has_network_details!
    @network_details.destroy
    redirect_to asset_path(@network_details.asset), notice: 'Detalles de red borrados correctamente'
  end

  private
  def network_details_params
    params.required(:network_detail).permit(:ip, :mask, :gateway, :dns)
  end

  def find_network_detail
    @network_details = NetworkDetail.find(params[:id])
  end

  def find_asset
    @asset = Asset.find(params[:asset_id])
  end

end