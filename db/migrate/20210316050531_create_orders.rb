class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :donation, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
