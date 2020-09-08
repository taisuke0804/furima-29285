class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :sending_area
  belongs_to_active_hash :sending_day

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :item, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price, presence: true, numericality: {greater_than: 299, less_than: 10000000}
    validates :image
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id, :condition_id, :delivery_fee_id, :sending_area_id, :sending_day_id
  end
  
  
  belongs_to :user
  has_one :management
  has_one_attached :image
end
