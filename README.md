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
| email           | string    | null: false                    |
| last_name       | string    | null: false                    |
| first_name      | string    | null: false                    |
| last_name_kana  | string    | null: false                    |
| first_name_kana | string    | null: false                    |
| birthday        | date      | null: false                    |

### Association

- has_many :items
- has_many :coments




## shipping_addrese テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| user             | reference | null: false, foreign_key: true |
| post_cord        | string    | null: false                    |
| prefecture_id    | integer   | null: false                    |
| municipality     | string    | null: false                    |
| addrese          | string    | null: false                    |
| building_name    | string    | -                              |
| phone_number     | string    | null:false                     |

### Association

- belongs_to :transation
- belongs_to_active_hash :prefectures

## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| user               | reference | null: false, foreign_key: true |
| product_name       | string    | null: false                    |
| introduction       | text      | null: false                    |
| category_id        | integer   | null: false                    |
| status_id          | integer   | null: false                    |
| delivery_fee_id    | integer   | null: false                    |
| shipment_source_id | integer   | null: false                    |
| shippibg_day_id    | integer   | null: false                    |
| price              | integer   | null: false                    |

### Association

- has_many :coments
- belongs_to :user
- belongs_to_active_hash :categorys
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fees
- belongs_to_active_hash :shipment_souces
- belongs_to_active_hash :shipping_days

## coments テーブル

| Column  | Type      | Options                       |
| ------- | --------- | ----------------------------- |
| user    | reference | null: false, foreign_key:true |
| item    | reference | null: false, foreign_key:true |
| coment  | text      | null: false                   |


### Association

- belongs_to :user
- belongs_to :item

## transation

| Column           | Type      | Options                       |
| ---------------- | --------- | ----------------------------- |
| user             | reference | null: false, foreign_key:true |
| item             | reference | null: false, foreign_key:true |
| shipping_addrese | reference | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_adderese


