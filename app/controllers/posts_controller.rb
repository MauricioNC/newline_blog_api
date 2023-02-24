class PostsController < ApplicationController
  before_action :set_post, only: %i[show update delete]

  def index
    @posts = Post.all
    render json: @posts, status: :ok
  rescue => e
    render json: {error: e.message}, status: :unprocessable_entity
  end

  def create
    @post = Post.new(post_params)

    render json: @post, status: :created if @post.save
  rescue => e
    render json: {error: e.message}, status: :unprocessable_entity
  end

  def show
    render json: @post, status: :ok if @post
  rescue => e
    rrender json: {error: e.message}, status: :unprocessable_entity
  end

  def update
    render json: @post, status: :ok if @post.update
  rescue => e
    render json: {error: e.message}, status: :unprocessable_entity
  end

  def delete
    render json: "Record deleted successfully", status: :ok if @post.delete
  rescue => e
    render json: {error: e.message}, status: :unprocessable_entity
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :body, category_ids: [], tag_ids: [])
  end
end
