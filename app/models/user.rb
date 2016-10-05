class User < ApplicationRecord

  has_many :restaurants, dependent: :destroy, dependent: :restrict_with_error
  has_many :reviews, dependent: :destroy, dependent: :restrict_with_error

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable <<< HINT HINT
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
