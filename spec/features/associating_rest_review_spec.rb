describe 'it creates a review attatched to a restaurant', type: :feature do
  it 'it creates a review attatched to a restaurant' do
    visit '/restaurants/new'
    fill_in 'restaurant[name]', with: 'Pizzeria'
    fill_in 'restaurant[description]', with: 'a restaurant that serves pizza pie'
    click_button('Save Restaurant')
    # expect {click_button('Save Restaurant')}.to change(Restaurant, :count).by(1)
    expect(page).to have_current_path('/restaurants/1')
    expect(page).to have_content('Pizzeria')

    click_button 'Add Review'
    expect(page).to have_current_path('/restaurants/1/review/new')
    fill_in 'review[rating]', with: 4
    fill_in 'review[comment]', with: "What a wonderful meal we had, thoroughly recommend it, the digestion and excretion were well facilitated too"
    click_button('submit')
    # expect(Review, :restaurant_id).to equal(1)
    expect(page).to have_content("Rating: 4 Comment: What a wonderful meal we had")
  end
end
