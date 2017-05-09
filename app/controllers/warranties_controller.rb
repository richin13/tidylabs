class WarrantiesController < ApplicationController
  before_action :find_warranty

  def edit
  end

  def update
    if @warranty.update(warranty_params)
      unless @warranty.asset.has_warranty?
        @warranty.asset.has_warranty!
      end
      redirect_to asset_path(@warranty.asset_id), notice: 'La garantía se guardó correctamente'
    else
      puts @warranty.errors.inspect
      render :edit
    end
  end

  def destroy
    @warranty.asset.has_warranty!
    redirect_to asset_url(@warranty.asset.id), notice: 'La garantía se borró correctamente'
  end

  private
  def warranty_params
    params.required(:warranty).permit(:purchase_date, :month_period, :agent_name, :agent_phone)
  end

  def find_warranty
    @warranty = Warranty.find(params[:id])
  end
end
