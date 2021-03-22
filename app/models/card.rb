class Card < ApplicationRecord
  validates :card_token, :customer_token, presence: true

  belongs_to :user
end
