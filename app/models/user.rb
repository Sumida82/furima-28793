class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        has_many :items
        has_many :purchases

        with_options presence: true do
          validates :name
          with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
            validates :first_name
            validates :family_name
          end
          with_options format: {with: /\A[ァ-ヶー－]+\z/} do
            validates :first_name_kana
            validates :family_name_kana
          end
          validates :birth
        end

end
