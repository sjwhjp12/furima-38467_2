# README

## users table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | unique: true, null: false|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string   | null: false |
| last_name_kana     | string   | null: false |
| first_name_kana    | string | null: false |
| birth              | date | null: false |


### Association

- has_many :purchase_records
- has_many :items

## items table

| Column                     | Type   | Options     |
| -----------------------    | ------ | ----------- |
| item_name                  | string | null: false |
| item_text                  | text | null: false |
| item_category_id           | integer | null: false |
| item_status_id             | integer   | null: false |
| shipping_status_id         | integer   | null: false |
| item_prefecture_id         | integer   | null: false |
| item_scheduled_delivery_id | integer | null: false |
| price                   | integer | null: false |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## orders table

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| postal_code             | string | null: false |
| item_prefecture_id      | integer | null: false |
| city                    | string | null: false |
| building                | string   |           |
| addresses               | string   | null: false |
| phone_number            | string   | null: false |
| purchase_record      | references | null: false, foreign_key: true | null: false |

### Association

- belongs_to :purchase_record

## purchase_records table

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| user                    | references | null: false, foreign_key: true |
| item                    | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :item
- belongs_to :user




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