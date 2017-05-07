class AreasController < ApplicationController
  before_action :authenticate_user!
  before_action :find_area, only: [:show, :edit, :update]

  def index
    @areas = Area.all
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)

    if @area.save
      flash[:success] = "Area creada satisfactoriamente"
      redirect_to @area
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @area.update(area_params)
      redirect_to area_path(@area)
    else
      redirect_to :edit
    end
  end 

  private
    def area_params
      params.require(:area).permit(:name, :description, :photo)
    end

    def find_area
      @area = Area.find(params[:id])
    end
end
