require 'rails_helper'

module FeatureHelpers
  def create_restaurant(name)
    visit '/'
    click_link('Add Restaurant')
    fill_in 'restaurant[name]', with: name
    fill_in 'restaurant[description]', with: 'a restaurant that serves pizza pie'
    click_button('Save Restaurant')
  end

  def add_review(rating)
    visit '/restaurants/1/review/new'
    fill_in 'review[rating]', with: rating
    fill_in 'review[comment]', with: "What a wonderful meal we had, thoroughly recommend it, the digestion and excretion were well facilitated too"
    click_button('Submit')
  end

  def user_sign_up
    visit '/users/sign_up'
    fill_in 'user[email]', with: "rosie@allott.com"
    fill_in 'user[password]', with: "password"
    fill_in 'user[password_confirmation]', with: "password"
    click_button("Sign up")
  end

  def user_log_in
    fill_in 'user[email]', with: "rosie@allott.com"
    fill_in 'user[password]', with: "password"
  end

  def user_log_out
    find('#dropdown_box').click
    click_on("Log Out")
  end

end
