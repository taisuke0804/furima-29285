class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :management
end
