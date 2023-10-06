class Order < ApplicationRecord

  CART_TYPE = ["Visa","Paypal","Mastercard","Maestro"]

  # validates :card_type, presence: true
  validates :card_number, presence: true, numericality: { only_integer: true }, length: { is: 16 }
  validates :cvc, presence: true, numericality: { only_integer: true }, length: { is: 3 }
  validates :order_confirmation_email, presence: true, format: { with: /\A.*@.*\.com\z/ }
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { is: 8 }
  validates :exp_date, presence: true

end
