class Donation < ApplicationRecord
  validates :name, :description, :price, presence: true

  validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]{1,40}+\z/ }
  
  validates :description, format: { with: /\A[ぁ-んァ-ヶ一-龥々]{1,1000}+\z/ }

  validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}

  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  
  has_one :order
  belongs_to :user
end
