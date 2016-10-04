class ReviewController < ApplicationController

  def index
  end

  def new
    # puts "hELLOOOOOOOOOOO"
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
  # 
  # def show
  #   @reviews = Restaurant.includes(:review).where(:restaurant_id => params[:restaurant_id])
  #   Conversation.includes(:participants).where(:id => params[:participants])
  # end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(params.require(:review).permit(:rating, :comment))
    redirect_to @restaurant
  end
end
