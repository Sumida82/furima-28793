class SendingDestination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase
  belongs_to_active_hash :prefecture_code

  validates :prefecture_code_id, numericality: { other_than: 1 }
end
