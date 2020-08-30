class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,20}\z/
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: "半角英数字混合6~20文字で入力してください"}
  
  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"}
    validates :family_name_kata, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください"}
    validates :first_name_kata, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください"}
    validates :birth
  end
end