class Donation < ApplicationRecord
  validates :name, :description, :price, presence: true

  validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}

  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  
  has_one :order
  belongs_to :user
end
