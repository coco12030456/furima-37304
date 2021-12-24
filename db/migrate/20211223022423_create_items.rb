class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,          null: false
      t.text :info,             null: false
      t.integer :price,         null: false
      t.integer :category_id,   null: false
      t.integer :condition_id,  null: false
      t.integer :send_price_id, null: false
      t.integer :area_id,       null: false
      t.integer :send_day_id,   null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
