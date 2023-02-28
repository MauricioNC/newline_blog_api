class PostsController < ApplicationController
  before_action :set_post, only: %i[show update delete]

  def index
    @posts = Post.all

    render json: @posts, status: :ok if @posts
    rrender json: @posts.errors.full_messages, status: :unprocessable_entity
  end

  def create
    @post = Post.new(post_params)

    render json: @post, status: :created if @post.save
    render json: @post.errors.full_messages, status: :unprocessable_entity
  end

  def show
    render json: @post, status: :ok if @post
    rrender json: @post.errors.full_messages, status: :unprocessable_entity
  end

  def update
    render json: @post, status: :ok if @post.update
    rrender json: @post.errors.full_messages, status: :unprocessable_entity
  end

  def delete
    render json: "Record deleted successfully", status: :ok if @post.delete
    rrender json: @post.errors.full_messages, status: :unprocessable_entity
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :body, category_ids: [], tag_ids: [])
  end
end
