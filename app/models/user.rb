class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
    validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX}

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"}
    validates :family_name_kata, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください"}
    validates :first_name_kata, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください"}
    validates :birth
  end
end