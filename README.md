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

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |  ## ニックネーム
| email            | string  | null: false |  ## eメール
| password         | string  | null: false |  ## パスワード
| family_name      | string  | null: false |  ## 苗字
| first_name       | string  | null: false |  ## 名前
| family_name_kata | string  | null: false |  ## ミョウジ
| first_name_kata  | string  | null: false |  ## ナマエ
| birth_year       | integer | null: false |  ## 生年月日（年）
| birth_month      | integer | null: false |  ## 生年月日（月）
| birth_day        | integer | null: false |  ## 生年月日（日）

### Association

- has_many :items
- has_many :comments
- has_many :managements


## managements テーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| item      | references | null: false, foreign_key: true |  ## 商品
| user 　　　| references | null: false, foreign_key: true |  ## 出品者

### Association

- belongs_to :user
- belongs_to :item
- has_one    :purchase


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | string     | null: false                    |  ## 商品名
| price        | integer    | null: false                    |  ## 値段
| category     | integer    | null: false                    |  ## カテゴリー
| condition    | integer    | null: false                    |  ## 商品状態
| explanation  | text       | null: false                    |  ## 商品説明
| delivery_fee | integer    | null: false                    |  ## 発送料負担
| sending_area | integer    | null: false                    |  ## 発送元地域
| sending_day  | integer    | null: false                    |  ## 発送目安
| user         | references | null: false, foreign_key: true |  ## 出品者ID
| favorite     | integer    |                                |  ## お気に入り

### Association

- has_one    :management
- belongs_to :user
- has_one    :comment


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |  ## コメント
| user    | references | null: false, foreign_key: true |  ## ユーザーID
| item    | references | null: false, foreign_key: true |  ## アイテムID

### Association

- belongs_to :user
- belongs_to :item


## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |  ## 郵便番号
| prefecture      | integer    | null: false                    |  ## 県
| city            | string     | null: false                    |  ## 市町村
| street_number   | string     | null: false                    |  ## 番地
| building        | string     |                                |  ## 建物
| phone_number    | integer    | null: false                    |  ## 電話番号
| management      | references | null: false, foreign_key: true |  ## 管理テーブル

### Association

- belongs_to :management