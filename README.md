## users テーブル

This README would normally document whatever steps are necessary to get the
application up and running.
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name(kana)      | string | null: false |
| last_name(kana)       | string | null: false |
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
| prefecture           | integer | null: false, foreign_key: true |
| post_code            | string  | null: false, foreign_key: true |
| city                 | string  | null: false, foreign_key: true |
| town                 | string  | null: false, foreign_key: true |
| building             | string  |                                |
| telephone            | string  | null: false, foreign_key: true |
| item_transaction_id  | string  | null: false, foreign_key: true |

* Database creation
### Association

* Database initialization
- belongs_to :item_transaction

* How to run the test suite
## items テーブル

* Services (job queues, cache servers, search engines, etc.)
| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| list            | string  | null: false |
| detail          | text    | null: false |
| price           | string  | null: false |
| category        | integer | null: false |
| status          | integer | null: false |
| fee             | integer | null: false |
| delivery_place  | integer | null: false |
| delivery_days   | integer | null: false |

* Deployment instructions
### Association

* ...
- belongs_to :user
- has_one :address
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