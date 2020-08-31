class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item,            null: false
      t.integer    :price,           null: false
      t.integer    :category_id,        null: false
      t.integer    :condition_id,       null: false
      t.text       :explanation,     null: false
      t.integer    :delivery_fee_id,    null: false
      t.integer    :sending_area_id,    null: false
      t.integer    :sending_day_id,     null: false
      t.references :user,            null: false, foreign_key: true
      t.integer    :favorite 
      t.timestamps 
    end
  end
end
