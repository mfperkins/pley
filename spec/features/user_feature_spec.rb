describe 'user actions' do

  it 'should allow user to sign up' do
    expect{user_sign_up}.to change(User, :count).by(1)
    expect(page).to have_current_path '/restaurants'
    expect(page).to have_content 'rosie@allott.com'
  end

  it 'should allow user to log out' do
    user_sign_up
    user_log_out
    expect(page).to_not have_content 'rosie@allott.com'
  end

  it 'should allow user to log in' do
    user_sign_up
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
    visit '/'
    find('#dropdown_box').click
    click_on("Log In")
    user_log_in
    click_button('Log in')
    expect(page).not_to have_content 'rosie@allott.com'
    expect(page).to have_content 'Invalid Email or password.'
  end
end

describe 'logging in with facebook' do

  before(:each) do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it 'should allow user to create an account with facebook' do
    visit '/users/sign_up'
    mock_auth_facebook_hash
    click_link("Sign in with Facebook")
    expect(page).to have_content("mattyperky@passiveaggressive.com")
    expect(page).to have_current_path('/restaurants')
  end

  # it 'can handle an authentication error' do
  # end
end
