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

### Association

* has_many :items
* has_many :records

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| price                               | string     | null: false                    |
| user(出品者)                        | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :records

## records table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

## ships table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| address     | text       | null: false                    |
| item        | references | null: false, foreign_key: true |
| record      | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :records