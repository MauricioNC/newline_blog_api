class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update delete]

  def index
    @categories = Category.all
    render json: @categories, status: :ok
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def show
    if @category
      render json: @category, status: :ok
    else
      render json: @category, status: :not_found
    end
  end

  def update
    if @category.update
      render json: @category, status: :ok
    else
      render json: @category, status: :unprocessable_entity
    end
  end

  def delete
    if @category.delete
      render json: "Record deleted successfully", status: :ok
    else
      render json: @category.errors, status: :unprocesable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name)
  end
end
