# テーブル設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/c20cc72cef936383c9f6449f409202b6.png)](https://gyazo.com/c20cc72cef936383c9f6449f409202b6)

## stores テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :consultation
- has_many :rooms, through: :consultation
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :consultation
- has_many :stores, through: :consultation
- has_many :messages

## consultation テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| store  | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :store
- belongs_to :room

## messages テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| ingredients  | string     |                                |
| preservation | boolean    |                                |
| expiry       | datetime   |                                |
| comment      | text       |                                |
| store        | references | null: false, foreign_key: true |
| room         | references | null: false, foreign_key: true |

### Association

- belongs_to :store
- belongs_to :room