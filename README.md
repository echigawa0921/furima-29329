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

# FURIMA

# ユーザーが商品の出品・購入を行うことのできるアプリです

<https://furima-29329.herokuapp.com/>

# Basic認証
* ID admin
* pass 2222

# 購入者アカウント
* email sample@sample.com
* pass sample1
* card 4242424242424242
* 利用期限 3/24
* セキュリティコード 123

# 出品者アカウント
* email sample2@sample.com
* pass sample2

# 利用方法
* トップの新規登録ボタンからユーザー登録をします
* 出品ボタンから商品の出品ができます
* 購入したい商品をクリックし購入画面で購入ができます

# 目指した課題解決
* 商品購入者が、商品について気になる点を気軽に質問できるようにコメント機能を実装しました

# 要件定義
* ユーザー登録機能 ユーザーが新規登録できる
* 商品出品機能 ユーザーが商品の出品できる
* 商品購入機能 ユーザーが商品の購入できる
* コメント機能 ユーザーが商品にコメントできる

# データベース設計
<https://drive.google.com/file/d/1z5IGTrPeT3ZSTPs-65ByRGhHV-zDnHC2/view?usp=sharing>


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
- has_many :item_purchases



## shipping_addresses テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| item_purchase    | reference | null: false, foreign_key: true |
| post_cord        | string    | null: false                    |
| prefecture_id    | integer   | null: false                    |
| municipality     | string    | null: false                    |
| addrese          | string    | null: false                    |
| building_name    | string    | -                              |
| phone_number     | string    | null:false                     |

### Association

- belongs_to :item_purchase
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
- has_one :item_purchase
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
| comment | text      | null: false                   |


### Association

- belongs_to :user
- belongs_to :item

## item_purchases

| Column           | Type      | Options                       |
| ---------------- | --------- | ----------------------------- |
| user             | reference | null: false, foreign_key:true |
| item             | reference | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_adderess


