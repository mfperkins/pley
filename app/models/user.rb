class User < ApplicationRecord

  has_many :restaurants
  has_many :reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable <<< HINT HINT
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
