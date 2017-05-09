class TechnicalDetailsController < ApplicationController
  before_action :find_technical_detail

  def edit
  end

  def update
    if @technical_detail.update(technical_details_params)
      unless @technical_detail.asset.has_tech_details?
        @technical_detail.asset.has_tech_details!
      end
      redirect_to asset_url(@technical_detail.asset.id), notice: 'Especificaciones técnicas guardadas correctamente'
    else
      render :edit
    end
  end

  def destroy
    asset = @technical_detail.asset
    # @technical_detail.destroy This is problematic!
    asset.has_tech_details!
    redirect_to asset_url(asset.id), notice: 'Especificaciones técnicas borradas correctamente'
  end

  private
  def technical_details_params
    params.required(:technical_detail).permit(:cpu, :ram, :hdd, :os, :other)
  end

  def find_technical_detail
    @technical_detail = TechnicalDetail.find(params[:id])
  end
end