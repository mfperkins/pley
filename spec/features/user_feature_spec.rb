describe 'user sign up' do
  it 'should allow user to sign up' do
    user_sign_up
    expect{click_button('Sign up')}.to change(User, :count).by(1)
    expect(page).to have_current_path '/restaurants'
    expect(page).to have_content 'Welcome rosie@allot.com'
  end
end
