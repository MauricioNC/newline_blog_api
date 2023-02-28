class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update delete]

  def index
    @categories = Category.all

    render json: @categories, status: :ok if @categories
    render json: @categories.errors.full_messages, status: :unprocessable_entity
  end

  def create
    @category = Category.new(category_params)

    render json: @category, status: :created if @category.save
    render json: @category.errors.full_messages, status: :unprocessable_entity
   end

  def show
    render json: @category, status: :ok if @category
    render json: @category.errors.full_messages, status: :not_found
  end

  def update
    render json: @category, status: :ok if @category.update
    render json: @category.errors.full_messages, status: :unprocessable_entity
  end

  def delete
    render json: "Record deleted successfully", status: :ok if @category.delete
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
