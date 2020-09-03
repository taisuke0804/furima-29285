class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string      :post_number,     null: false
      t.integer     :prefecture,      null: false
      t.string      :city,            null: false
      t.string      :street_number,   null: false
      t.string      :building
      t.string      :phone_number,    null: false
      t.references  :management,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
