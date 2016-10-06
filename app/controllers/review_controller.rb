class ReviewController < ApplicationController

  def index
  end

  def new
    if user_signed_in?
      @user = current_user
      @restaurant = Restaurant.find(params[:restaurant_id])
      @review = Review.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    @review.user = User.find(current_user.id)
      if @review.save
        redirect_to @restaurant
      else
        flash[:notice] = @review.errors.full_messages.join(", ")
        redirect_to new_restaurant_review_path
      end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
