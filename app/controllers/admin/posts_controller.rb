class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
      redirect_to admin_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :genre_id, :customer_id, :restaurant_name, :title, :introduction, :phone_number, :address)
  end
end
