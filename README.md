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
| birth_date         | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル
| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| item_name            | string      | null: false                    |
| item_price           | integer     | null: false                    |
| item_info            | text        | null: false                    |
| category_id          | integer     | null: false                    |
| item_condition_id    | integer     | null: false                    |
| who_pays_shipping_id | integer     | null: false                    |
| prefecture_id        | integer     | null: false                    |
| shipping_date_id     | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user

## ordersテーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| user           | references  | null: false, foreign_key: true |
| item           | references  | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping_info


## shipping_infosテーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| zip_code       | string      | null: false                    |
| prefecture_id  | integer     | null: false                    |
| city           | string      | null: false                    |
| address        | string      | null: false                    |
| building       | string      |                                |
| phone          | string      | null: false                    |
| user           | references  | null: false, foreign_key: true |


### Association
- belongs_to :order
