class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :telephone_number, null: false
      t.integer :order_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end