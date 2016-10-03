require 'rails_helper'

describe 'review form' do
  it 'lets a user create a review by inputting a rating and a comment' do
    visit 'review/new'
    fill_in 'review[rating]', with: 4
    fill_in 'review[comment]', with: "What a wonderful meal we had, thoroughly recommend it, the digestion and excretion were well facilitated too"
    click_button 'button'
    expect(page).to include "What a wonderful meal"
  end
end
