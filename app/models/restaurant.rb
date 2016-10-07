class Restaurant < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true

  has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def ave_of_reviews
    self.reviews.average(:rating)
  end
end
