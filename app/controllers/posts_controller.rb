class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
    # render :index
  end

  def show
    @posts = Post.find_by(id: params[:id])
    render json: @posts
    # render :show
  end

  def create
    @photo = Post.create(
      name: params[:post][:name],
      body: params[:post][:body],
      image: params[:post][:image],
    )
    redirect_to "/posts"
  end

  def edit
    @photo = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @photo = Post.find_by(id: params[:id])
    @photo.update(
      name: params[:post][:name],
      body: params[:post][:body],
      image: params[:post][:image],
    )
    redirect_to "/posts"
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to "/posts", status: :see_other
  end
end
