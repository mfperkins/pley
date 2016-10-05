describe 'it creates a review attatched to a restaurant', type: :feature do

  before(:each) do
    create_restaurant
    click_button('Save Restaurant')
  end

  it 'it creates a review attatched to a restaurant' do
    add_review(2)
    expect {click_button('Submit')}.to change(Review, :count).by(1)
    expect(page).to have_content("Rating: 2 Comment: What a wonderful meal we had")
  end

  it 'should only allow user a number between 1 and 5' do
    add_review(6)
    click_button('Submit')
    expect(page).to have_current_path '/restaurants/1/review/new'
    expect(page).to have_content "Rating must be less than or equal to 5"
  end

  it 'should not allow user to enter nothing in rating' do
    add_review('')
    click_button('Submit')
    expect(page).to have_content "Rating is not a number"
  end
end
