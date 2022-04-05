# README

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| user                  | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| first_name            | string | null: false               |
| last_name             | string | null: false               |
| first_name_kana       | string | null: false               |
| last_name_kana        | string | null: false               |
| birthday              | date   | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false                    |
| price          | integer    | null: false                    |
| info           | text       | null: false                    |
| user           | references | null: false, foreign_key: true |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| shipping_fee_id| integer    | null: false                    |
| region_id      | integer    | null: false                    |
| schedule_id    | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :order


## orders テーブル(購入した事実)

| Colum| Type       | Options                        |
| ---- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user


## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| region_id        | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
