describe 'uploading and viewing images' do
  before(:each) do
    user_sign_up
    Restaurant.new
    @user = User.find_by(id: 1)
    @restaurant = @user.restaurants.create(:name => "Pizzeria", :description => "good", :image => "../public/broccoli.jpg")
    puts @restaurant
  end

  it 'should render image on the page' do
    expect(true).to equal(false)
  end
end
