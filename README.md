# アプリ名

Donation_app

# 概要

クラウドファンディングのアプリケーションです。
寄付金を求めたい人が寄付を投稿し、寄付金を出したい人が寄付できるようにしたアプリケーションを作成しました。

# 本番環境

## URL

Markdown:[Donation_app](http://donation-app-34523.herokuapp.com/)

## テスト用アカウント

### Basic認証

- ID：admin
- Pass：2222

### 寄付者用

- メールアドレス：test1@example.com
- パスワード：aaaa1111

### 寄付用カード情報

- 番号：4242424242424242
- 期限：1月30年
- セキュリティコード：123

### 投稿者用

- メールアドレス：test2@example.com
- パスワード：bbbb2222

# 制作背景

寄付に関するアプリケーションを作ってみたいと思ったことがきっかけです。  
ちょうど作成するときが東日本大地震から10年経ったことから、被災地に何か支援ができることがないかと思ったことから作成に至りました。  
困っている人が気軽に寄付を投稿することができ、寄付したい人が簡単に寄付できるように機能を追加しました。

# DEMO

### トップページ（寄付投稿一覧画面）
![Donation_app](https://i.gyazo.com/f59e7e05ac81fabaffa1b7e44f49bfa0.png"アプリケーショントップページ")

- ユーザーが投稿した寄付の内容を一覧で表示しています。
- 「寄付をする」ボタンを押下すると寄付されたことがわかるように表示されるようにしました。

### クレジットカード登録画面
![Donation_app](https://i.gyazo.com/4e385e760069844e644bcfa7ce053edf.png"カード登録画面")

### マイページ画面
![Donation_app](https://i.gyazo.com/fa3998724c0acd566a4940db262fe2d9.png"マイページ画面")

- クレジットカード登録で支払い都度、カード情報の入力の手間を省きました。
- マイページには登録したカード情報を表示されるようにしました。個人情報であるため、マイページで登録したカード情報の確認ができます。

### 寄付投稿画面
![Donation_app](https://i.gyazo.com/6028a721930663914e696a43f63af35c.png"寄付投稿画面")

- ユーザー個人が寄付の内容を投稿できるようにしました。
- 個々の悩みを自身で発信することができ、誰でも悩みを解決できるようにしました。

# 工夫したポイント

- カード情報の入力の手間を省いたことです。寄付金を払う時に毎回カード情報の入力をすることに対して面倒だと思ったことがきっかけです。
- カード登録を一度したらカード情報の入力をしないように実装しました。
- マイページ遷移ボタンはわかりやすい表示にしました。
- 寄付された場合でも「寄付をする」ボタンは非表示にせずに、寄付してもされても「寄付をする」ボタンの表示は残すようにし、寄付の限度をなくしたところです。

# 使用技術(開発環境)

Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code / PAY.JP / JavaScript / RSpec

# 課題や今後実装したい機能

実装したい機能は寄付した、寄付された合計金額を表示させたいと考えています。
合計金額表示でどれだけの寄付金が集まったのか投稿者がわかりやすいようにしたいです。
また、寄付者のマイページに今まで寄付した金額を表示できれば寄付者の満足度も高まると思い、寄付金の合計金額の表示実装をしたいと思っています。

# DB設計

## ER図

Markdown:![donation](https://user-images.githubusercontent.com/78420140/112101268-b4afe800-8be9-11eb-8608-2ee83abe0102.png)

## users テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| nickname             | string     | null: false                    |
| email                | string     | null: false, unique: true      |
| encrypted_password   | string     | null: false                    |

### Association

- has_many :donations
- has_many :orders
- has_one :card

##  donations テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## cards テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card_token       | string     | null: false |
| customer_token   | integer    | null: false |
| user             | string     | null: false, foreign_key: true |

### Association
- belongs_to :user

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| donation         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :donation