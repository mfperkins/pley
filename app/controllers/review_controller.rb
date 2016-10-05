class ReviewController < ApplicationController

  def index
  end

  def new
      if user_signed_in?
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
      else
        redirect_to new_user_session_path
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(params.require(:review).permit(:rating, :comment))
      if @review.save
        redirect_to @restaurant
      else
        flash[:notice] = @review.errors.full_messages.join(", ")
        redirect_to new_restaurant_review_path
      end
  end
end
