class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :image,           null: false
      t.string     :name,            null: false
      t.text       :introduction,    null: false
      t.integer    :category,        null: false
      t.integer    :trading_status,  null: false
      t.integer    :postage_paye,    null: false
      t.integer    :prefecture_code, null: false
      t.integer    :preparation_day, null: false
      t.integer    :price,           null: false
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end
