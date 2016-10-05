describe 'it creates a review attatched to a restaurant', type: :feature do
  it 'it creates a review attatched to a restaurant' do
    create_restaurant
    click_button 'Save Restaurant'
    add_review(2)
    expect {click_button('Submit')}.to change(Review, :count).by(1)
    expect(page).to have_content("Rating: 2 Comment: What a wonderful meal we had")
  end
end
