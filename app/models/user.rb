class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kata, presence: true
  validates :first_name_kata, presence: true
  validates :birth, presence: true
end
