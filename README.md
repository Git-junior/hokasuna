# アプリケーション名

### ほかすな！！

# 概要
飲食店向け、食材廃棄防止チャットアプリーケーション

# 本番環境
https://hokasuna.herokuapp.com/

# ログイン/ログアウト方法
- Basic認証
  - ID : admin
  - PASS : 2222

- テスト用アカウント
  - アカウント1（池袋）
    - メールアドレス : ikebukuro@cafe.com
    - パスワード : ikebukuro

  - アカウント2（名古屋）
    - メールアドレス : nagoya@cafe.com
    - パスワード : nagoya

  - アカウント3（天王寺）
    - メールアドレス : tennoji@cafe.com
    - パスワード : tennoji

- ログアウト方法
1. トップページのサイドバーの店舗名（画像では「池袋」）をクリック
[![Image from Gyazo](https://i.gyazo.com/aa4570bd1ad2203c956e20e6c2d6e78c.png)](https://gyazo.com/aa4570bd1ad2203c956e20e6c2d6e78c)
2. 「ログアウト」ボタンをクリック
[![Image from Gyazo](https://i.gyazo.com/a1cb65713a4ef82fc6f0b85f750f605c.png)](https://gyazo.com/a1cb65713a4ef82fc6f0b85f750f605c)

# 利用方法
1. 店舗情報を登録
2. 食材の融通相談をしたい、登録済の店舗とチャットで相談
3. 相談が終了すれば、チャットルーム（メッセージ含む）を削除
4. 相談データの履歴は、自動反映されたGoogleスプレッドシート上で確認

# 制作背景
現在勤務中の飲食店において、食材廃棄削減に取り組み中。
課題は2点。
1点目は、過剰仕入で起こる食材廃棄ロスを、どう防ぐか。
2点目は、店舗間の連絡手段が電話またはメールというレスポンスの遅さを、どう改善するか。
これらの課題を解決すべく、食材廃棄ロスの防止と、その為のタイムリーな食材の融通相談が出来るアプリケーションを開発。

# DEMO

## メッセージ一覧画面
[![Image from Gyazo](https://i.gyazo.com/bf7777f44162d8f5cd6b02c57e8c4471.png)](https://gyazo.com/bf7777f44162d8f5cd6b02c57e8c4471)

## ログ一覧画面
[![Image from Gyazo](https://i.gyazo.com/7249f00d51e0c9a7dde3a571ac625f46.png)](https://gyazo.com/7249f00d51e0c9a7dde3a571ac625f46)

# 実装予定項目
下記4機能
  1. ユーザー（店舗）管理機能
  2. （チャット）ルーム管理機能
  3. メッセージ管理機能
  4. ログ管理機能

- 1~3については、実装後に、モデル単体テストコードと結合テストコードを記述。
- 4については、messagesテーブルの一部カラムを、メッセージ送信時にGoogleスプレッドシートに、ログとして自動反映させる。

# DB設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/7b6306c9dc587d8fae8519ae4b264eaa.png)](https://gyazo.com/7b6306c9dc587d8fae8519ae4b264eaa)

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
| quantity     | integer    |                                |
| preservation | boolean    |                                |
| expiry       | datetime   |                                |
| comment      | text       |                                |
| store        | references | null: false, foreign_key: true |
| room         | references | null: false, foreign_key: true |

### Association

- belongs_to :store
- belongs_to :room
