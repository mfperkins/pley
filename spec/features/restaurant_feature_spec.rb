describe 'creating restaurant entry', type: :feature do
  it 'creates a new entry in restaurant table' do
    create_restaurant
    expect {click_button('Save Restaurant')}.to change(Restaurant, :count).by(1)
    expect(page).to have_current_path('/restaurants/2')
    expect(page).to have_content('Pizzeria')
  end
end
