class Price < ApplicationRecord
  belongs_to :donation
  has_one :order
end
