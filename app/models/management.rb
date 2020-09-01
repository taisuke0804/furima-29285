class Management < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
