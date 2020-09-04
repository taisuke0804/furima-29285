class CreditOrder

  include ActiveModel::Model
  #attr_accessor :token
  attr_accessor :token, :post_number, :prefecture_id, :city, :street_number, :building, :phone_number, :item_id
  #attr_accessor :authenticity_token, :post_number, :prefecture_id, :city, :street_number, :building, :phone_number, :item_id

  with_options presence: true do
    validates :post_number
    validates :prefecture_id
    validates :city
    validates :street_number
    validates :phone_number
    #validates :authenticity_token
    validates :token
  end

  def save
    Purchase.create(post_number: post_number, prefecture_id: prefecture_id, city: city, street_number: street_number, building: building, phone_number: phone_number)
    #Purchase.create(post_number: post_number, prefecture_id: prefecture_id, city: city, street_number: street_number, building: building, phone_number: phone_number)
    
    #Management.create(user_id: user_id, item_id: item_id)
  end
end