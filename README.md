# README

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
| type         | string     | null: false                    |

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