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


# freemarket_sample DB設計 
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|last_name|string|nul: false|
|family_name_kana|string|nul: false|
|last_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
 ## Association
- has_many: items
- has_one: address
- has_one: card


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|ull: false, foreign_key: true|
|prefectures|string|nul: false|
|municipalities|string|nul: false|
|address|string|nul: false|
|building|string||
|phone number|integer|unique: true|
 ## Association
- belongs_to: user


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign: true|
|card_number|integer||
|year|integer||
|month|integer||
|security_number|integer||
## Association
- belongs_to: user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|shopping_charges|string|null: false|
|shopping_area|string|null: false|
|shopping_date|string|null: false|
|price|integer|null:false|
|description|string|null: false|
|status|string|null: false|
 ## Association
- has_many: users
- has_one: image
- has_one: bland
- has_one: category


## imagesテーブル
Column|Type|Options|
|------|----|-------|
|item_id|reference|null: false, foreign_key: true|
|image|text|null: false|
## Association
- belongs_to: item


## categoriesテーブル
Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
|item_id|reference|null: false, foreign_key: true|
## Association
- belongs_to: item


## brandsテーブル
Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|reference|null: false, foreign_key: true|
## Association
- belongs_to: item