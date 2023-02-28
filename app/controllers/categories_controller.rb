class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update delete]

  def index
    @categories = Category.all

    if @categories
      render json: @categories, status: :ok
      return
    end
    render json: @categories.errors.full_messages, status: :unprocessable_entity
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
      return
    end
    render json: @category.errors.full_messages, status: :unprocessable_entity
   end

  def show
    if @category
      render json: @category, status: :ok
      return
    end
    render json: @category.errors.full_messages, status: :not_found
  end

  def update
    if @category.update
      render json: @category, status: :ok
      return
    end
    render json: @category.errors.full_messages, status: :unprocessable_entity
  end

  def delete
    if @category.delete
      render json: "Record deleted successfully", status: :ok
      return
    end
    render json: @category.errors.full_messages, status: :unprocessable_entity
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name)
  end
end
