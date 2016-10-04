class ReviewController < ApplicationController
  def new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    puts "thisssssss #{@restaurant}"
    @review = @restaurant.reviews.create(params.require(:review).permit(:rating, :comment))

    @review.save
    redirect_to @review
  end
end
