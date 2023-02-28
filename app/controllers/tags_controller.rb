class TagsController < ApplicationController
  before_action :set_tag, only: %i[show update delete]

  def index
    @tags = Tag.all
    render json: @tags, status: :ok if @tags
    render json: @tags.errors.full_messages, status: :unprocessable_entity
  end

  def create
    @tag = Tag.new(tag_params)

    render json: @tag, status: :created if @tag.save
    render json: @tag.errors.full_messages, status: :unprocessable_entity
  end

  def show
    render json: @tag, status: :ok if @tag
    render json: @tag.errors.full_messages, status: :not_found
  end

  def update
    render json: @tag, status: :ok if @tag.update
    render json: @tag.errors.full_messages, status: :unprocessable_entity
  end

  def delete
    render json: "Record deleted successfully", status: :ok if @tag.delete
    render json: @tag.errors.full_messages, status: :unprocessable_entity
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
