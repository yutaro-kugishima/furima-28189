class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :list, null:false
      t.text :detail, null:false
      t.integer :price, null:false
      t.integer :category_id, null:false
      t.integer :status_id, null:false
      t.integer :fee_id, null:false
      t.integer :delivery_place_id, null:false
      t.integer :delivery_days_id, null:false
      t.integer :user_id, null:false
      t.timestamps
    end
  end
end