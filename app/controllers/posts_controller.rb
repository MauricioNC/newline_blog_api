class PostsController < ApplicationController
  before_action :set_post, only: %i[show update delete]

  def index
    @posts = Post.all
    respond_to do |format|
      format.json @posts, status: :ok
    end
  end

  def create
    @post.new(post_params)

    if @post.save
      respond_to do |format|
        format.json @post, status: :created
      end
    else
      respond_to do |format|
        format.json @post.errors, status: :unprocessable_entity
      end
    end
  end

  def show
    @post = Post.find(params[:id])

    if @post
      respond_to do |format|
        format.json @post, status: :ok
      end
    else
      respond_to do |format|
        format.json @post, status: :not_found
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update
      respond_to do |format|
        format.json @post, status: :ok
      end
    else
      respond_to do |format|
        format.json @post, status: :unprocessable_entity
      end
    end
  end

  def delete
    @post = Post.find(params[:id])

    if @post.delete
      respond_to do |format|
        format.json "Record deleted successfully", status: :ok
      end
    else
      respond_to do |format|
        format.json @post.errors, status: :unprocesable_entity
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:post).require(:title, :description, :body, category_ids: [], tags_ids: [])
  end
end
