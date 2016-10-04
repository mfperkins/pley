require 'rails_helper'

module FeatureHelpers
  def create_restaurant
    visit '/restaurants/new'
    fill_in 'restaurant[name]', with: 'Pizzeria'
    fill_in 'restaurant[description]', with: 'a restaurant that serves pizza pie'
  end

  def add_review
    fill_in 'review[rating]', with: 4
    fill_in 'review[comment]', with: "What a wonderful meal we had, thoroughly recommend it, the digestion and excretion were well facilitated too"
  end
end
