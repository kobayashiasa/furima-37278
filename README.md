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
- has_many :shipping_info
- has_many :order

## itemsテーブル
| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| item_name         | string      | null: false                    |
| item_price        | integer     | null: false                    |
| item_info         | text        | null: false                    |
| category          | string      | null: false                    |
| item_condition    | string      | null: false                    |
| who_pays_shipping | string      | null: false                    |
| item_region       | string      | null: false                    |
| shipping_date     | string      | null: false                    |
| user              | references  | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user
- has_one :shipping_info

## orderテーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| user           | references  | null: false, foreign_key: true |
| item           | references  | null: false, foreign_key: true |
| shipping_info  | references  | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :shipping_info
- belongs_to :user


## shipping_infoテーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| zip_code       | string      | null: false                    |
| prefecture     | string      | null: false                    |
| city           | string      | null: false                    |
| address        | string      | null: false                    |
| building       | string      | null: false                    |
| phone          | string      | null: false                    |
| user           | references  | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :order
- belongs_to :item
