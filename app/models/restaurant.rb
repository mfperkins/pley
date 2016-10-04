class Restaurant < ApplicationRecord
    has_many :reviews, dependent: :destroy

    def ave_of_reviews
      self.reviews.average(:rating)
    end
end
