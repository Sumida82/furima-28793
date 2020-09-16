class CreateSendingDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :sending_destinations do |t|
      t.string     :post_code,       null: false
      t.integer    :prefecture_code, null: false
      t.string     :city,            null: false
      t.string     :house_number
      t.string     :building_name,   null: false
      t.string     :phone_number,    null: false
      t.references :purchase,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
