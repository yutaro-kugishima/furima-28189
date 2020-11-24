## users テーブル

This README would normally document whatever steps are necessary to get the
application up and running.
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana      | string | null: false |
| last_name_kana       | string | null: false |
| birth_date            | date | null: false |
| email_address         | string | null: false |
| password              | string | null: false |

Things you may want to cover:
### Association

* Ruby version
- has_many :items
- has_many :item_transactions

* System dependencies
## address テーブル

* Configuration
| Column               | Type    | Options                        |
| -------------------- | ------  | ------------------------------ |
| postal_code          | string  | null: false,                   |
| prefecture           | integer | null: false                    |
| city                 | string  | null: false,                   |
| house_number         | string  | null: false,                   |
| building_name        | string  |                                |
| telephone            | string  | null: false                    |
| item_transaction_id  | integer | null: false, foreign_key: true |

* Database creation
### Association

* Database initialization
- belongs_to :item_transaction

* How to run the test suite
## items テーブル

* Services (job queues, cache servers, search engines, etc.)
| Column             | Type    | Options                        |
| ------------------ | ------  |------------------------------- |
| list               | string  | null: false                    |
| detail             | text    | null: false                    |
| price              | integer | null: false                    |
| category_id        | integer | null: false                    |
| status_id          | integer | null: false                    |
| fee_id             | integer | null: false                    |
| delivery_place_id  | integer | null: false                    |
| delivery_days_id   | integer | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

* Deployment instructions
### Association

* ...
- belongs_to :user
- has_one :item_transaction

## item_transaction テーブル

| Column  | Type    | Options                        |
| ------- | ------  | ------------------------------ |
| item_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user