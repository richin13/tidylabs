class LoansController < ApplicationController
  before_action :find_asset
  before_action :find_loan, only: [:show, :toggle]

  def index
    @loans = Loan.where(asset_id: @asset.id).order(:created_at).page params[:page]
  end

  def new
    @loan = Loan.new
  end

  def show

  end

  def create
    @loan = Loan.new(loan_params)
    @loan.asset = @asset

    if @loan.save
      @asset.loan!
      redirect_to asset_path(@loan.asset_id), notice: 'Se registró el préstamo correctamente'
    else
      render :new
    end
  end

  def toggle
    @loan.toggle
    redirect_to asset_loan_path(@asset.id, @loan.id), notice: 'Se registró el cambio correctamente'
  end

  private
  def loan_params
    params.required(:loan).permit(:applicant_name,
                                  :applicant_dni, :phone_number, :asset_id, :observations, :return_date)
  end

  def find_asset
    @asset = Asset.find(params[:asset_id])
  end

  def find_loan
    @loan = Loan.find(params[:id])
  end
end
