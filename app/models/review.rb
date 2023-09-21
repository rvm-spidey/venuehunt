class Review < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  validates :content, presence: true

  # validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }
  # validates :content, length: {minimum: 20}
end
