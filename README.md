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
|last_name|string|null: false|
|family_name_kana|string|null: false|
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
|user_id|reference|null: false, foreign_key: true|
|destination_family_name|string|null: false|
|destination_last_name|string|null: false|
|destination_family_name_kana|string|null: false|
|destination_last_name_kana|string|null: false|
|Postal_code|integer|null: false|
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
|user_id|reference|null: false, foreign_key: true|
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
|brand_id|reference|null: false, foreign_key: true|
|category_id|reference|null: false, foreign_key: true|
|shopping_charges|string|null: false|
|shopping_area|string|null: false|
|shopping_date|string|null: false|
|price|integer|null:false|
|description|string|null: false|
|status|string|null: false|

 ## Association
- has_many: images
- belongs_to: user
- belongs_to: brand
- belongs_to: category


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
## Association
- has_many: items


## brandsテーブル
Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- has_many: items