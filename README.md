# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

	
# テーブル設計

## users テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| nickname        | string    | null: false                    |
| password        | string    | null: false                    |
| e-mail          | string    | null: false                    |
| user_id         | reference | null: false, foreign_key: true |
| last_name       | string    | null: false                    |
| first_name      | string    | null: false                    |
| last_name_kana  | string    | null: false                    |
| first_name_kana | string    | null: false                    |
| birth_year_id   | reference | null: false, foreign_key: true |
| birth_month_id  | reference | null: false, foreign_key: true |
| birth_day_id    | reference | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :coments
- has_one  :profile
- has_one  :shipping_addrese
- belongs_to :users
- belongs_to_active_hash :birth_year
- belongs_to_active_hash :birth_month
- belongs_to_active_hash :birth_day


## shipping_addrese テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| user_id          | reference | null: false, foreign_key: true |
| post_cord        | integer   | null: false                    |
| prefecture_id    | reference | null: false, foreign_key: true |
| municipality     | string    | null: false                    |
| addrese          | string    | null: false                    |
| building_name    | string    | -                              |
| phone_number     | integer   | null:false                     |

### Association

- belongs_to :user

## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| user_id            | reference | null: false, foreign_key: true |
| product_name       | string    | null: false                    |
| introduction       | text      | null: false                    |
| category_id        | reference | null: false, foreign_key: true |
| status_id          | reference | null: false, foreign_key: true |
| delivery_fee_id    | reference | null: false, foreign_key: true |
| shipment_source_id | reference | null: false, foreign_key: true |
| shippibg_day_id    | reference | null: false, foreign_key: true |
| price              | integer   | null: false                    |

### Association

- has_many :coments
- belongs_to :users
- belongs_to_active_hash :categorys
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fees
- belongs_to_active_hash :shipment_souces
- belongs_to_active_hash :shipping_days

## coments テーブル

| Column  | Type      | Options                       |
| ------- | --------- | ----------------------------- |
| user_id | reference | null: false, foreign_key:true |
| item_id | reference | null: false, foreign_key:true |
| coment  | text      | null: false                   |


### Association

- belongs_to :users
- belongs_to :items

