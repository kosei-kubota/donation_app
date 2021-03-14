class CreateDonationOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :donation_orders do |t|
      t.integer    :price,        null: false
      t.references :donation, foreign_key: true

      t.timestamps
    end
  end
end
