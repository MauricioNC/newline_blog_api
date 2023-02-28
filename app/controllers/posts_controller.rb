class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  def index
    @posts = Post.all

    if @posts
      render json: @posts, status: :ok
      return
    end
    rrender json: @posts.errors.full_messages, status: :unprocessable_entity
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created
      return
    end
    render json: @post.errors.full_messages, status: :unprocessable_entity
  end

  def show
    if @post
      render json: @post, status: :ok
      return
    end
    rrender json: @post.errors.full_messages, status: :unprocessable_entity
  end

  def update
    if @post.update
      render json: @post, status: :ok
      return
    end
    rrender json: @post.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    if @post.delete
      render json: "Record deleted successfully", status: :ok
      return
    end
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
