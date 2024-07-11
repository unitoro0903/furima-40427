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

# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name_kanji   | string              | null: false               |
| family_name_kanji  | string              | null: false               |
| first_name_kana    | string              | null: false               |
| family_name_kana   | string              | null: false               |
| nickname           | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_many :items
* has_many :records

## items table

| Column             | Type              |Options                 |
|--------------------|-------------------|------------------------|
| title              | string            | null: false            |
| price              | integer           | null: false            |
| user            | references | null: false, foreign_key: true |
| explanation        | string     | null: false                   |
| category_id        | integer           | null: false              |
| condition_id      | integer           |null:false                 |
| region_id   | integer    | null: false                    |
| ship_fee_id  | integer     | null: false                    |
| require_time_id | integer  | null: false                 |



### Association

- belongs_to :user
- has_one :record

## records table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :ship


## ships table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| region_id   | integer    | null: false                    |
| record      | references | null: false, foreign_key: true |
| municipalities  | string     | null:false                 |
| street_address      | string     | null:false             |
| phone_number | string     | null:false                     |
| postcode    | string     | null:false                     |
| building_name      | string     | null:false             |

### Association

- belongs_to :record