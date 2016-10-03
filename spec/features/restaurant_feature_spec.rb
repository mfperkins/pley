describe 'creating restaurant entry', type: :feature do
  it 'creates a new entry in restaurant table' do
    visit '/restaurants/new'
    fill_in 'restaurant[name]', with: 'Pizzeria'
    fill_in 'restaurant[description]', with: 'a restaurant that serves pizza pie'
    click_button 'Save Restaurant'
    expect(page).to have_current_path('/restaurants/1')
  end
end
