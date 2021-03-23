class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text       :description, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
