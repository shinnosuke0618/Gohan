class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post = Post.find(params[:post_id])
    @reviews = @post.reviews
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_posts_path
  end

  private

  def review_params
    params.require(:review).permit(:post_id, :customer_id, :score, :coutent)
  end

end