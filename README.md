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
| birth            | date    | null: false |

### Association

- has_many :items

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| image           | string     | null: false |
| name            | string     | null: false |
| introduction    | text       | null: false |
| category        | integer    | null: false |
| trading_status  | integer    | null: false |
| postage_payer   | integer    | null: false |
| prefecture_code | integer    | null: false |
| preparation_day | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| item   | references | null: false |
| user   | references | null: false |

### Association

- belongs_to :item
- has_one :sending_destination

## sending_destinations テーブル

| post_code       | string     | null: false |
| prefecture_code | integer    | null: false |
| city            | string     | null: false |
| house_number    | string     | null: false |
| building_name   | string     | null: false |
| phone_number    | string     | null: false |
| purchase        | references | null: false |

### Association

- belongs_to :purchase