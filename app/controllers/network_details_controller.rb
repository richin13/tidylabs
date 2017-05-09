class NetworkDetailsController < ApplicationController
  before_action :find_network_detail

  def edit
  end

  def update
    if @network_details.update(network_details_params)
      unless @network_details.asset.has_network_details?
        @network_details.asset.has_network_details!
      end

      redirect_to asset_url(@network_details.asset_id), notice: 'Detalles de red guardados correctamente'
    else
      render :edit
    end
  end

  def destroy
    @network_details.asset.has_network_details!
    redirect_to asset_url(@network_details.asset_id), notice: 'Detalles de red borrados correctamente'
  end

  private
  def network_details_params
    params.required(:network_detail).permit(:ip, :mask, :gateway, :dns)
  end

  def find_network_detail
    @network_details = NetworkDetail.find(params[:id])
  end

end