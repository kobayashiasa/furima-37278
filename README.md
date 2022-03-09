# テーブル設計

## usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | date    | null: false               |

### Association

- has_many :items
- has_many :comments

## itemsテーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| item_name      | string      | null: false                    |
| item_price     | integer     | null: false                    |
| item_info      | text        | null: false                    |
| category       | string      | null: false                    |
| item_condition | string      | null: false                    |
| shipping_cost  | string      | null: false                    |
| item_region    | string      | null: false                    |
| shipping_date  | string      | null: false                    |
| user           | references  | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user

## commentsテーブル
| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| content    | text        | null: false                    |
| item       | references  | null: false, foreign_key: true |
| user       | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
