class ReviewController < ApplicationController
  def new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(rating: params[:rating], comment: params[:comment])

    @review.save
    redirect_to @review
  end
end
