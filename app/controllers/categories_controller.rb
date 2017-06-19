class CategoriesController < ApplicationController
  before_action :find_category, except: [:index, :new, :create]

  def index
    @categories = AssetCategory.all

    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def show
  end

  def new
    @category = AssetCategory.new
  end

  def create
    @category = AssetCategory.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Categoría creada correctamente'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_url(@category), notice: 'Categoría actualizada correctamente'
    else
      render :edit
    end
  end

  private
  def category_params
    params.required(:asset_category).permit(:name, :description,
                                            :accepts_warranty_details, :accepts_technical_details,
                                            :accepts_network_details, :accepts_security_details)
  end

  def find_category
    @category = AssetCategory.find(params[:id])
  end
end
