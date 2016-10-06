describe Restaurant do

  let(:restaurant) {Restaurant.new({name: "Restaurant", description: "A good restaurant"})}

  describe 'Average rating' do
    pending "we need a warden for unit tests like this"
    #
    # before(:each) do
    #   restaurant.save
    #   restaurant.reviews.create({rating: 1, comment: "what a terrible place!"})
    #   restaurant.reviews.create({rating: 4, comment: "what a great place!"})
    # end

    it 'should calculate an average rating'
      # expect(restaurant.ave_of_reviews).to eq(2.5)
    

  end

end
