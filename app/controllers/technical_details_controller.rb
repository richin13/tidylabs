class TechnicalDetailsController < ApplicationController
  before_action :find_technical_detail, except: [:new, :create]
  before_action :find_asset, except: [:update, :destroy]

  def new
    @technical_detail = TechnicalDetail.new
  end

  def create
    @technical_detail = TechnicalDetail.create(technical_details_params)
    @technical_detail.asset = @asset

    if @technical_detail.save
      @technical_detail.asset.has_tech_details!
      redirect_to asset_path(@asset), notice: 'Especificaciones técnicas guardadas correctamente'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @technical_detail.update(technical_details_params)
      redirect_to asset_url(@technical_detail.asset_id), notice: 'Especificaciones técnicas actualizadas correctamente'
    else
      render :edit
    end
  end

  def destroy
    @technical_detail.asset.has_tech_details!
    @technical_detail.destroy
    redirect_to asset_path(@technical_detail.asset), notice: 'Especificaciones técnicas borradas correctamente'
  end

  private
  def technical_details_params
    params.required(:technical_detail).permit(:cpu, :ram, :hdd, :os, :other, :asset_id)
  end

  def find_technical_detail
    @technical_detail = TechnicalDetail.find(params[:id])
  end

  def find_asset
    @asset = Asset.find(params[:asset_id])
  end
end