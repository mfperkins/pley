describe 'it creates a review attatched to a restaurant', type: :feature do

  before(:each) do
    create_restaurant("Pizzeria")
  end

  it 'it creates a review attatched to a restaurant' do
    user_sign_up
    expect {add_review(2)}.to change(Review, :count).by(1)
    expect(page).to have_content("Rating: 2 What a wonderful meal we had")
  end

  it 'should only allow user a number between 1 and 5' do
    user_sign_up
    add_review(6)
    expect(page).to have_current_path '/restaurants/1/review/new'
    expect(page).to have_content "Rating must be less than or equal to 5"
  end

  it 'should not allow user to enter nothing in rating' do
    user_sign_up
    add_review('')
    expect(page).to have_content "Rating is not a number"
  end

  it 'should only allow user to write a review if signed in' do
    click_button('Add Review')
    expect(page).to have_current_path('/users/sign_in')
  end
end
