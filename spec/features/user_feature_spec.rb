describe 'user actions' do

  before(:each) do
    user_sign_up
  end

  it 'should allow user to sign up' do
    expect{click_button('Sign up')}.to change(User, :count).by(1)
    expect(page).to have_current_path '/restaurants'
    expect(page).to have_content 'rosie@allott.com'
  end

  it 'should allow user to log out' do
    click_button('Sign up')
    find('#dropdown_box').click
    click_on("Log Out")
    expect(page).to_not have_content 'rosie@allott.com'
  end

  it 'should allow user to log in' do
    click_button('Sign up')
    visit ('/')
    find('#dropdown_box').click
    click_on('Log Out')
    find('#dropdown_box').click
    click_on("Log In")
    user_log_in
    click_button('Log in')
    expect(page).to have_content 'rosie@allott.com'
  end

  it 'should not allow a bad user to log in' do
    find('#dropdown_box').click
    click_on("Log In")
    user_log_in
    click_button('Log in')
    expect(page).not_to have_content 'rosie@allott.com'
    expect(page).to have_content 'Invalid Email or password.'

  end
end
