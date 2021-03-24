# テーブル設計


## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| name                | string  | null: false               |
| birth_day           | integer | null: false               |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| value       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| description | text       | null: false                    |
| delivery    | integer    | null: false                    |
| place       | string     | null: false                    |
| how_long    | integer    | null: false                    |
| category    | sting      | null: false                    |
| status      | string     | null: false                    |
### Association

- has_one :buys
- belongs_to :user



## buys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| card_number    | text       | null: false                    |
| card_deadline  | string     | null: false                    |
| security_number| string     | null: false                    |




### Association

- has_one :customer
- belongs_to :user
- belongs_to :item

##  customer テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| buy               | references | null: false, foreign_key: true |
| postal_code       | text       | null: false                    |
| address           | text       | null: false                    |
| address2          | text       | null: false                    |
| address3          | text       | null: false                    |
| tel_number        | text       | null: false                    |
| build_name        | text       |                                |

### Association

- belongs_to :buy