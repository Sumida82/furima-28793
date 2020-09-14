class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :trading_status
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :category
    validates :trading_status
    validates :postage_payer
    validates :prefecture_code
    validates :preparation_day
    validates :price
  end

    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }, format: { with:/\A[0-9]+\z/ }

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :trading_status_id
    validates :postage_payer_id
    validates :prefecture_code_id
    validates :preparation_day_id
  end

end
