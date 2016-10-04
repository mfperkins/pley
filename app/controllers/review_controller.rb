class ReviewController < ApplicationController

  def index
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(params.require(:review).permit(:rating, :comment))
    redirect_to @restaurant
  end
end
