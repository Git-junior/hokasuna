# アプリケーション名
ほかすな！！

# 概要
飲食店向け、食材廃棄防止チャットアプリーケーション

# 本番環境
https://hokasuna.herokuapp.com/

## Basic認証
- ID : admin
- PASS : 2222

# 利用方法
1. 店舗情報を登録
2. 食材の融通相談をしたい、登録済の１店舗とチャットで相談
3. 相談が終了すれば、チャットルーム（メッセージ含む）を削除

# 制作背景
現在勤務中の飲食店において、食材廃棄削減に取り組み中。
課題は2点。
1点目は、過剰仕入で起こる食材廃棄ロスをどう防ぐか。2点目は、店舗間の相談手段が、電話またはメールが多く、レスポンスが遅い。
これらの課題を解決すべく、タイムリーに食材の融通相談が出来るアプリケーションを開発。

# DEMO
## メッセージ一覧画面
[![Image from Gyazo](https://i.gyazo.com/e6aee31a8efd7618073d2ff1dfac10da.png)](https://gyazo.com/e6aee31a8efd7618073d2ff1dfac10da)

# 実装予定項目
各機能、実装後にモデル単体テストコードを記述
- ユーザー（店舗）管理機能
- （チャット）ルーム管理機能
- メッセージ管理機能

# DB設計

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