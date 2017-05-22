class WarrantiesController < ApplicationController
  before_action :find_warranty, except: [:new, :create]
  before_action :find_asset, except: [:update, :destroy]

  def new
    @warranty = Warranty.new
  end

  def create
    @warranty = Warranty.create(warranty_params)
    @warranty.asset = @asset

    if @warranty.save
      @warranty.asset.has_warranty!
      redirect_to asset_path(@asset), notice: 'Garantía guardada correctamente'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @warranty.update(warranty_params)
      redirect_to asset_url(@warranty.asset_id), notice: 'Garantía actualizada correctamente'
    else
      render :edit
    end
  end

  def destroy
    @warranty.asset.has_warranty!
    @warranty.destroy
    redirect_to asset_path(@warranty.asset), notice: 'Garantía borrada correctamente'
  end

  private
  def warranty_params
    params.required(:warranty).permit(:purchase_date, :month_period, :agent_name, :agent_phone, :asset)
  end

  def find_warranty
    @warranty = Warranty.find(params[:id])
  end

  def find_asset
    @asset = Asset.find(params[:asset_id])
  end
end
