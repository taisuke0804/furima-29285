class CreditOrder

  include ActiveModel::Model
  attr_accessor :token, :post_number, :prefecture_id, :city, :street_number, :building, :phone_number, :item_id, :user_id

  POSTAL_CODE_REGEX = /\d{3}-\d{4}/

  with_options presence: true do
    validates :post_number, format: { with: POSTAL_CODE_REGEX }
    validates :prefecture_id
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{1,11}\z/ }
    #validates :phone_number, format: { with: /\d{1,11}/ }
    #validates :phone_number, format: { with: /0\d{9,10}/ }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    management = Management.create(user_id: user_id, item_id: item_id)
    
    Purchase.create(post_number: post_number, prefecture_id: prefecture_id, city: city, street_number: street_number, building: building, phone_number: phone_number, management_id: management.id)
    
  end
end