class OrderAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :post_code
    validates :prefecture_code_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
  end

  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture_code_id, numericality: { other_than: 1 }
  validates :phone_number, format: { with: /\A\d{1,11}\z/ }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    SendingDestination.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end