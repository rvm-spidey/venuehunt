class Order < ApplicationRecord

  CART_TYPE = [
    { name: "Visa", photo: "office.png" },
    { name: "Debit", photo: "office.png" },
    { name: "Credit", photo: "office.png" }
  ]


  validates :card_number, presence: true
  validates :cvc, presence: true, length: { maximum: 3 }
  validates :order_confirmation_email, presence: true, format: { with: /\A.*@.*\.com\z/ }
  validates :phone_number, presence: true, length: { maximum: 8 }
end
