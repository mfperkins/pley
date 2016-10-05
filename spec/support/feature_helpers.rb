require 'rails_helper'

module FeatureHelpers
  def create_restaurant
    visit '/restaurants/new'
    fill_in 'restaurant[name]', with: 'Pizzeria'
    fill_in 'restaurant[description]', with: 'a restaurant that serves pizza pie'
  end

  def add_review(rating)
    visit '/restaurants/1/review/new'
    fill_in 'review[rating]', with: rating
    fill_in 'review[comment]', with: "What a wonderful meal we had, thoroughly recommend it, the digestion and excretion were well facilitated too"
  end

  def update_restaurant
    visit '/restaurants/1/edit'
    fill_in 'restaurant[name]', with: 'Prophète'
    fill_in 'restaurant[description]', with: 'a quite pretentious restaurant'
  end


end
