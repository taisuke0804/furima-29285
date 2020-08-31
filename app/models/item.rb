class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :sending_area
  belongs_to_active_hash :sending_day

  #空の投稿を保存できないようにする
  validates :item, :image, :explanation, :price, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :delivery_fee, presence: true
  validates :sending_area, presence: true
  validates :sending_day, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :sending_area_id, numericality: { other_than: 1 }
  validates :sending_day_id, numericality: { other_than: 1 }
  
  
  belongs_to :user
  has_one :management
  has_one_attached :image
end
