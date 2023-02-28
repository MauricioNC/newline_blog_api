class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: %i[show update destroy]

  def index
    @tags = Tag.all

    if @tags
      render json: @tags, status: :ok
      return
    end
    render json: @tags.errors.full_messages, status: :unprocessable_entity
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created
      return
    end
    render json: @tag.errors.full_messages, status: :unprocessable_entity
  end

  def show
    if @tag
      render json: @tag, status: :ok
      return
    end
    render json: @tag.errors.full_messages, status: :not_found
  end

  def update
    if @tag.update(tag_params)
      render json: @tag, status: :ok
      return
    end
    render json: @tag.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    if @tag.delete
      render json: "Record deleted successfully", status: :ok
      return
    end
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
