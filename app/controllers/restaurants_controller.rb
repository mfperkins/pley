class RestaurantsController < ApplicationController
  def new
    flash[:notice]
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
      if @restaurant.save
        redirect_to @restaurant
      else
        flash[:notice] = @restaurant.errors.full_messages.join(", ")
        redirect_to new_restaurant_path
      end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
      if @restaurant.update(restaurant_params)
        redirect_to @restaurant
      else
        render 'edit'
      end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end
end
