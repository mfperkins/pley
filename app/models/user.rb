class User < ApplicationRecord

  has_many :restaurants, dependent: :destroy, dependent: :restrict_with_error
  has_many :reviews, dependent: :destroy, dependent: :restrict_with_error

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable <<< HINT HINT
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #  user.provider = auth.provider (probably don't need?)
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
   end

 end
end
