class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,            null: false
      t.integer :price,           null: false
      t.text :info,               null: false
      t.references :user,         null: false, foreign_key: true
      t.integer :category_id,     null: false
      t.integer :status_id,       null: false
      t.integer :shipping_fee_id, null: false
      t.integer :region_id,       null: false
      t.integer :schedule_id,     null: false
      t.timestamps
    end
  end
end
