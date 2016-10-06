require 'rails_helper'

describe 'creating restaurant entry', type: :feature do
  it 'creates a new entry in restaurant table' do
    user_sign_up
    expect {create_restaurant('Pizzeria')}.to change(Restaurant, :count).by(1)
    expect(page).to have_current_path('/restaurants/1')
    expect(page).to have_content('Pizzeria')
  end
end

describe 'restaurant list' do
  before(:each) do
    user_sign_up
    create_restaurant('Pizzeria')
  end

  it 'shows all restaurants on index' do
    visit '/restaurants'
    expect(page).to have_content 'Pizzeria'
  end

  it 'should display the average rating for a restaurant' do
    add_review(1)
    add_review(3)
    expect(page).to have_content 'Rating: 2.0'
  end
end

describe 'edit or delete a restaurant listing if user signed in' do
  before(:each) do
    visit '/'
    user_sign_up
    expect(page).to have_content 'rosie@allott.com'
    create_restaurant("Zombies")
    expect(page).to have_content 'Zombies'
  end

  it 'should allow user to update a restaurant' do
    expect(page).to have_content 'Edit'
    click_link('Edit')
    edit_restaurant('Monster')
    expect(page).to have_content 'Monster'
  end

  it 'should allow user to delete a restaurant' do
    expect(page).to have_content 'Edit'
    expect {click_link('Delete')}.to change(Restaurant, :count).by(-1)
  end
end

describe 'edit or delete a restaurant listing if user not signed in' do
  before(:each) do
    @restaurant = Restaurant.new({name: "Restaurant", description: "A good restaurant"})
    @restaurant.save
  end

  it 'should allow user to update a restaurant' do
    visit '/restaurants/1'
    expect(page).not_to have_link('Edit')
  end

  it 'should allow user to delete a restaurant' do
    visit '/restaurants/1'
    expect(page).not_to have_link('Delete')
  end

  it 'should only allow user to write a review if signed in' do
    visit '/restaurants'
    click_link('Add Restaurant')
    expect(page).to have_current_path('/users/sign_in')
  end

end

describe 'validations' do
  it 'should not allow visitor to enter empty restaurant name' do
    user_sign_up
    create_restaurant("")
    expect(page).to have_current_path '/restaurants/new'
    expect(page).to have_content "Name can't be blank"
  end
end
