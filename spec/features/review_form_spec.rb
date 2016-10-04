require 'rails_helper'

describe 'review form' do
  xit 'lets a user create a review by inputting a rating and a comment' do
    visit 'review/new'
    fill_in 'review[rating]', with: 4
    fill_in 'review[comment]', with: "What a wonderful meal we had, thoroughly recommend it, the digestion and excretion were well facilitated too"
    expect {click_button('submit')}.to change(Review, :count).by(1)
    expect(page).to have_content("Rating: 4 Comment: What a wonderful meal we had")
    expect(page).to have_current_path('/review/1')
  end
end
