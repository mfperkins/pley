describe 'uploading and viewing images' do
  before(:each) do
    user_sign_up
  end

  it 'should render image on the page' do
    visit '/'
    click_link('Add Restaurant')
    fill_in 'restaurant[name]', with: "Pizzeria"
    fill_in 'restaurant[description]', with: 'a restaurant that serves pizza pie'
    page.attach_file('restaurant[image]', Rails.root + 'spec/features/broccoli.jpg')
    click_button('Save Restaurant')
    expect(page.find('#image_display')['src']).to have_content('broccoli.jpg')
  end
end
