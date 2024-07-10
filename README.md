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
| kanjifirstname     | string              | null: false               |
| kanjifamilyname    | string              | null: false               |
| kanafirstname      | string              | null: false               |
| kanafamilyname     | string              | null: false               |
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
| user.id            | references | null: false, foreign_key: true |
| explanation        | string     | null: false                   |
| category.id        | integer           | null: false              |
| condition.id      | integer           |null:false                 |



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
| region.id   | integer    | null: false                    |
| record      | references | null: false, foreign_key: true |
| shipfee.id  | string     | null: false                    |
| recuiretime.id | string     | null: false                 |
| shikutyouson  | string     | null:false                     |
| banchi      | string     | null:false                     |
| phonenumber | string     | null:false                     |
| postcode    | string     | null:false                     |

### Association

- belongs_to :record