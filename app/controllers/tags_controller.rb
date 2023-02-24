class TagsController < ApplicationController
  before_action :set_tag, only: %i[show update delete]

  def index
    @tags = Tag.all
    render json: @tags, status: :ok
  rescue => e
    render json: {error: e.errors}, status: :unprocessable_entity
  end

  def create
    @tag = Tag.new(tag_params)
    render json: @tag, status: :created if @tag.save
  rescue => e
    render json: {error: e.errors}, status: :unprocessable_entity
  end

  def show
    render json: @tag, status: :ok if @tag
  rescue => e
    render json: {error: e.errors}, status: :unprocessable_entity
  end

  def update
    render json: @tag, status: :ok if @tag.update
  rescue => e
    render json: {error: e.errors}, status: :unprocessable_entity
  end

  def delete
    render json: "Record deleted successfully", status: :ok
  rescue => e
    render json: {error: e.errors}, status: :unprocessable_entity
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
