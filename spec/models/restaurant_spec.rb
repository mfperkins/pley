describe Restaurant do

  let(:restaurant) {Restaurant.new({name: "Restaurant", description: "A good restaurant"})}

  describe 'Average rating' do

    before(:each) do
      restaurant.save
      restaurant.reviews.create({rating: 1, comment: "what a terrible place!"})
      restaurant.reviews.create({rating: 4, comment: "what a great place!"})
    end

    it 'should calculate an average rating' do
      puts restaurant.ave_of_reviews
      expect(restaurant.ave_of_reviews).to eq(2.5)
    end

  end


end
