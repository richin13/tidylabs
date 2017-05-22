class CategoriesController < ApplicationController
  def index
    @categories = AssetCategory.all

    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
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

  private

  def category_params
    params.required(:asset_category).permit(:name, :description)
  end
end
