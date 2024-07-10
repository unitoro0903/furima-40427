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
| password           | string              | null: false               |
| name               | string              | null: false               |
| nickname           | string              | null: false               |
| birthday           | string              | null: false               |
| address            | text                | null: false               |

### Association

* has_many :items
* has_many :records

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| price                               | string     | null: false                    |
| user(出品者)                        | references  | null: false, foreign_key: true |
| image                               | text       | null: false                    |
| explanation                         | string     | null: false                    |
| category                            | string     | null: false                    |
| condition                           | string     | null: false                    |



### Association

- belongs_to :user
- belongs_to :record

## records table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## ships table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| region      | text       | null: false                    |
| item(商品のID)　| references | null: false, foreign_key: true |
| record(購入情報のid) | references | null: false, foreign_key: true |
| shipfee        | string     | null: false                    |
| recuiretime | string | null: false, |


### Association

- belongs_to :item
- belongs_to :record