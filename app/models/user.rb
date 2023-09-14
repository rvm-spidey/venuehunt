class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  geocoded_by :company_address
  after_validation :geocode, if: :will_save_change_to_company_address?
  has_many :carts
  has_many :bookings, through: :carts
end
