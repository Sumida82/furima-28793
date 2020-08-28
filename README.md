# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| family_name      | string  | null: false |
| first_name_kana  | string  | null: false |
| family_name_kana | string  | null: false |
| birth_year       | date    | null: false |
| birth_month      | date    | null: false |
| birth_day        | date    | null: false |

### Association

- has_many :items

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| image           | string     | null: false |
| name            | string     | null: false |
| introduction    | text       | null: false |
| category        | string     | null: false |
| trading_status  | string     | null: false |
| postage_payer   | string     | null: false |
| prefecture_code | string     | null: false |
| preparation_day | string     | null: false |
| price           | integer    | null: false |
| fee             | integer    | null: false |
| profit          | integer    | null: false |
| user_id         | references | null: false |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card_number      | integer    | null: false |
| expiration_year  | integer    | null: false |
| expiration_month | integer    | null: false |
| security_code    | integer    | null: false |
| item_id          | references | null: false |

### Association

- belongs_to :item
- has_one :sending_destination

## sending_destinations テーブル

| post_code       | integer    | null: false |
| prefecture_code | integer    | null: false |
| city            | string     | null: false |
| house_number    | string     | null: false |
| building_name   | string     | null: false |
| phone_number    | integer    | null: false |
| purchase_id     | references | null: false |

### Association

- belongs_to :purchase