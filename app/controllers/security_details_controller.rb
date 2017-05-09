class SecurityDetailsController < ApplicationController
  before_action :find_security_details

  def edit
  end

  def update
    if @security_details.update(security_details_params)
      unless @security_details.asset.has_security_details?
        @security_details.asset.has_security_details!
      end

      redirect_to asset_url(@security_details.asset_id), notice: 'Detalles de seguridad guardados correctamente'
    else
      render :edit
    end
  end

  def destroy
    @security_details.asset.has_security_details!
    redirect_to asset_url(@security_details.asset_id), notice: 'Detalles de seguridad borrados correctamente'
  end

  private
  def security_details_params
    params.required(:security_detail).permit(:username, :password)
  end

  def find_security_details
    @security_details = SecurityDetail.find(params[:id])
  end
end