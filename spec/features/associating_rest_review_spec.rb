describe 'it creates a review attatched to a restaurant', type: :feature do
  it 'it creates a review attatched to a restaurant' do
    create_restaurant
    expect {click_button('Save Restaurant')}.to change(Restaurant, :count).by(1)
    expect(page).to have_current_path('/restaurants/1')
    expect(page).to have_content('Pizzeria')

    click_button 'Add Review'
    expect(page).to have_current_path('/restaurants/1/review/new')
    add_review
    expect(page).to have_content("Rating: 4 Comment: What a wonderful meal we had")
  end
end
