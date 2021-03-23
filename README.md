# テーブル設計


## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |


### Association

- has_many :items
- has_many :buys


## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | text       | null: false                    |
| value      | text       | null: false                    |
| image      | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- has_many :buys
- belongs_to :user



## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- has_one :customer
- belongs_to :user
- belongs_to :item

##  customer テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| address           | text       | null: false                    |
| buy               | references | null: false, foreign_key: true |

### Association

- belongs_to :buy