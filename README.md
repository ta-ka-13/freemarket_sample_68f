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


Usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|email|string|nul:false|
|password|string|null: false|
|family_name|string|null: false|
|last_name|string||
|family_name_kana|string|
|last_name_kana|string||
|birth_year|integer||
|birth_month|integer|
|birth_day|integer|

 ## Association
has_many: items
has_one: adress
has_one: cards



adressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference||
|prefectures|string||
|municipalities|string||
|adress|string||
|building|string||
|phone number|integer||

 ## Association
 has_one: user


cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference||
|card_number|integer||
|year|integer||
|month|integer||
|security_number|integer||

## Association
has_one: user


itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference||
|categorys_id|reference||
|bland_id|reference||
|shopping_charges|string||
|shopping_area|string||
|shoping_date|string||
|price|integer||

 ## Association
 has_one: image
 has_one: bland
 has_one: category
 has_many: users



imageテーブル
Column|Type|Options|
|------|----|-------|
|item_id|reference||
|image|text||

## Association
has_many: items


categorysテーブル
Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry|string||
|item_id|reference||

## Association
has_many: items


blandsテーブル
Column|Type|Options|
|------|----|-------|
|name|string||
|item_id|reference||

## Association
has_one: item