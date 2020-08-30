class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item,            null: false
      t.integer    :price,           null: false
      t.integer    :category,        null: false
      t.integer    :condition,       null: false
      t.text       :explanation,     null: false
      t.integer    :delivery_fee,    null: false
      t.integer    :sending_area,    null: false
      t.integer    :sending_day,     null: false
      t.references :user,            null: false, foreign_key: true
      t.integer    :favorite 
      t.timestamps 
    end
  end
end
