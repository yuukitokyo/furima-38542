# DB 設計

## users table

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | date    | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| item_category_id   | integer    | null: false                    |
| item_state_id      | integer    | null: false                    |
| delivery_burden_id | integer    | null: false                    |
| delivery_area_id   | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| item_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## delivery_addresses table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| postal_code      | string     | null: false                    |
| delivery_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |


### Association

- belongs_to :order