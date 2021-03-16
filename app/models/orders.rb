# class Order
#   include ActiveModel::Model
#   attr_accessor :price, :user_id, :donation_id

#   with_options presence: true do
#     validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
#     validates :user_id
#     validates :donation_id
#   end

#   def save
#     donation_order = DonationOrder.create(user_id: user_id, donation_id: donation_id)
#     Address.create(price: price, donation_order_id: donation_order.id)
#   end
# end