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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association
has_many :items
has_many :purchases


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| explanation        | text   | null: false |
| category_id        | integer| null: false |
| status_id          | integer| null: false |
| shipping_charge_id | integer| null: false |
| prefecture_id      | integer| null: false |
| days_to_ship_id    | integer| null: false |
| price              | integer| null: false |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping

## shippings テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| post_code              | string     | null: false |
| prefecture_id          | integer    | null: false |
| city                   | string     | null: false |
| address                | string     | null: false |
| building               | string     |             |
| telephone              | string     | null: false |
| purchase               | references | null: false, foreign_key: true |

### Association
belongs_to :purchase