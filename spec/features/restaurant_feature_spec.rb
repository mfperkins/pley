require 'rails_helper'

describe 'creating restaurant entry', type: :feature do
  it 'creates a new entry in restaurant table' do
    create_restaurant
    expect {click_button('Save Restaurant')}.to change(Restaurant, :count).by(1)
    expect(page).to have_current_path('/restaurants/1')
    expect(page).to have_content('Pizzeria')
  end
end

describe 'restaurant list' do
  before(:each) do
    create_restaurant
    click_button('Save Restaurant')
  end

  it 'shows all restaurants on index' do
    visit '/restaurants'
    expect(page).to have_content 'Pizzeria'
  end

  it 'should display the average rating for a restaurant' do
    add_review(1)
    click_button('Submit')
    add_review(3)
    click_button('Submit')
    expect(page).to have_content 'Rating: 2.0'
  end
end

describe 'edit or delete a restaurant listing' do
  before(:each) do
    @restaurant = Restaurant.new({name: "Restaurant", description: "A good restaurant"})
    @restaurant.save
  end

  it 'should allow user to update a restaurant' do
    update_restaurant
    click_button('Save Restaurant')
    expect(page).to have_content 'Prophète'
  end

  it 'should allow user to delete a restaurant' do
    visit '/restaurants/1'
    expect {click_link('Delete')}.to change(Restaurant, :count).by(-1)
  end
end

describe 'validations' do
  it 'should not allow visitor to enter empty restaurant name' do
    visit '/restaurants/new'
    fill_in 'restaurant[name]', with: ''
    fill_in 'restaurant[description]', with: 'a quite pretentious restaurant'
    click_button('Save Restaurant')
    expect(page).to have_current_path '/restaurants/new'
    expect(page).to have_content "Name can't be blank"
  end
end
