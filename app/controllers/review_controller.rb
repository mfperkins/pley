class ReviewController < ApplicationController
  def new
    puts "hELLOOOOOOOOOOO"
    @restaurant = Restaurant.find(params[:restaurant_id])
    puts "sietgdgjdhgjdfhgjdhgd #{@restaurant} gdfgdfgdf"
    @review = Review.new
  end

  def show
    @reviews = Restaurant.includes(:review).where(:restaurant_id => params[:restaurant_id])
    puts "sietgdgjdhgjdfhgjdhgd #{@restaurant.id} ;A;A;A;;A;A"
    Conversation.includes(:participants).where(:id => params[:participants])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(params.require(:review).permit(:rating, :comment))
    redirect_to @reviews
  end
end
