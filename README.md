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
| email              | string | null: false |
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
| category           | string | null: false |
| status             | string | null: false |
| shipping_charge    | string | null: false |
| item_prefecture    | string | null: false |
| days_to_ship       | string | null: false |
| price              | integer| null: false |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchases

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping

## shipping テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| post_code              | string     | null: false |
| shipping_prefecture    | string     | null: false |
| city                   | string     | null: false |
| address                | string     | null: false |
| building               | string     |             |
| telephone              | integer    | null: false |
| purchase               | references | null: false, foreign_key: true |

### Association
belongs_to :purchases