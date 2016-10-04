describe 'creating restaurant entry', type: :feature do
  it 'creates a new entry in restaurant table' do
    visit '/restaurants/new'
    fill_in 'restaurant[name]', with: 'Pizzeria'
    fill_in 'restaurant[description]', with: 'a restaurant that serves pizza pie'
    expect {click_button('Save Restaurant')}.to change(Restaurant, :count).by(1)
    expect(page).to have_current_path('/restaurants/1')
    expect(page).to have_content('Pizzeria')
  end
end

describe 'restaurant list' do
  it 'shows all restaurants on index' do
    visit '/restaurants/new'
    fill_in 'restaurant[name]', with: 'Prophète'
    fill_in 'restaurant[description]', with: 'a quite pretentious restaurant'
    click_button('Save Restaurant')
    visit '/restaurants'
    expect(page).to have_content 'Prophète'
  end
end
