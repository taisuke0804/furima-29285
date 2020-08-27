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
- has_many :purchases
- has_many :comments

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |  ## 商品名
| price        | integer    | null: false                    |  ## 値段
| category     | string     | null: false                    |  ## カテゴリー
| condition    | string     | null: false                    |  ## 商品状態
| explanation  | text       | null: false                    |  ## 商品説明
| delivery_fee | string     | null: false                    |  ## 発送料負担
| sending_area | string     | null: false                    |  ## 発送元地域
| sending_day  | string     | null: false                    |  ## 発送目安
| favorite     | integer    |                                |  ## お気に入り
| user         | references | null: false, foreign_key: true |  ## ユーザーID

### Association

- belongs_to :user
- has_one    :comments
- has_one    :purchase

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
| card_number     | integer    | null: false                    |  ## カードナンバー
| card_term_year  | integer    | null: false                    |  ## 有効期限（年）
| card_term_month | integer    | null: false                    |  ## 有効期間（月）
| card_code       | integer    | null: false                    |  ## セキュリティーコード
| post_number     | integer    | null: false                    |  ## 郵便番号
| prefecture      | string     | null: false                    |  ## 県
| city            | string     | null: false                    |  ## 市町村
| street_number   | string     | null: false                    |  ## 番地
| building        | string     |                                |  ## 建物
| phone_number    | integer    | null: false                    |  ## 電話番号
| item            | references | null: false, foreign_key: true |  ## アイテムID
| price           | references | null: false, foreign_key: true |  ## 値段ID

### Association

- belongs_to :user
- belongs_to :item