class SecurityDetailsController < ApplicationController
  before_action :find_security_details, except: [:new, :create]
  before_action :find_asset, except: [:update, :destroy]

  def new
    @security_details = SecurityDetail.new
  end

  def create
    @security_details = SecurityDetail.create(security_details_params)
    @security_details.asset = @asset

    if @security_details.save
      @security_details.asset.has_security_details!
      redirect_to asset_path(@asset), notice: 'Detalles de seguridad guardados correctamente'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @security_details.update(security_details_params)
      redirect_to asset_url(@security_details.asset_id), notice: 'Detalles de seguridad actualizados correctamente'
    else
      render :edit
    end
  end

  def destroy
    @security_details.asset.has_security_details!
    @security_details.destroy
    redirect_to asset_path(@security_details.asset), notice: 'Detalles de seguridad borrados correctamente'
  end

  private
  def security_details_params
    params.required(:security_detail).permit(:username, :password)
  end

  def find_security_details
    @security_details = SecurityDetail.find(params[:id])
  end

  def find_asset
    @asset = Asset.find(params[:asset_id])
  end
end