# テーブル設計


## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| nick_name           | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_furigana  | string  | null: false               |
| first_name_furigana | string  | null: false               |
| birth_day           | date    | null: false               |

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
| delivery_id | integer    | null: false                    |
| place_id    | integer    | null: false                    |
| how_long_id | integer    | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
### Association

- has_one :buy
- belongs_to :user



## buys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |





### Association

- has_one :customer
- belongs_to :user
- belongs_to :item

##  customer テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| buy               | references | null: false, foreign_key: true |
| postal_code       | string     | null: false                    |
| place_id          | integer    | null: false                    |
| municipalities    | string     | null: false                    |
| address           | string     | null: false                    |
| tel_number        | string     | null: false                    |
| build_name        | string     |                                |

### Association

- belongs_to :buy