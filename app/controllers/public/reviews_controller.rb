class Public::ReviewsController < ApplicationController
before_action :authenticate_customer!, only: [:create]

  def index
    @post = Post.find(params[:post_id])
    @reviews = @post.reviews
  end

  def create
    @post = Post.find(params[:post_id])
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.post_id = @post.id
    if @review.save
      redirect_to post_reviews_path(@review.post)
    else
      render 'public/posts/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:post_id, :score, :content)
  end
end