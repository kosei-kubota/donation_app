class Order < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :donation_id
  end

  belongs_to :donation
  belongs_to :user
end
