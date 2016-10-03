class ReviewController < ApplicationController
  def new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    puts "its over here dumbasssssssss #{params[:review]}"
    @review = Review.new(params.require(:review).permit(:rating, :comment))

    @review.save
    redirect_to @review
  end
end
