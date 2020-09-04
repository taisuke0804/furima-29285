class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #belongs_to_active_hash :prefecture

  #attr_accessor :token

  #with_options presence: true do
    #validates :post_number
    #validates :prefecture_id
    #validates :city
    #validates :street_number
    #validates :phone_number
  #end

  belongs_to :management
end
