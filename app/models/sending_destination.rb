class SendingDestination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :prefecture_code_id, numericality: { other_than: 1 }
end
