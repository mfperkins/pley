class HomeController < ApplicationController
  def index
    redirect_to restaurants_path
  end
end
