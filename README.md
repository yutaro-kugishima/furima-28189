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
- has_one  :address
- has_many :items
- has_many :item_transactions

* System dependencies
## address テーブル

* Configuration
| Column     | Type    | Options     |
| ---------- | ------  | ----------- |
| prefecture | integer | null: false, foreign_key: true |
| post_code  | integer | null: false, foreign_key: true |
| city       | integer | null: false, foreign_key: true |
| town       | integer | null: false, foreign_key: true |
| building   | integer |                                |
| telephone  | integer | null: false, foreign_key: true |

* Database creation
### Association

* Database initialization
- belongs_to :item_transaction

* How to run the test suite
## items テーブル

* Services (job queues, cache servers, search engines, etc.)
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| list            | string | null: false |
| detail          | string | null: false |
| edit            | string | null: false |
| delete          | string | null: false |
| price           | string | null: false |
| category        | string | null: false |
| status          | string | null: false |
| fee             | string | null: false |
| delivery_place  | string | null: false |
| delivery_days   | string | null: false |

* Deployment instructions
### Association

* ...
- belongs_to :users
- has_one :address
- has_one :item_transaction

## item_transaction テーブル

| Column  | Type   | Options                        |
| ------- | ------ | ------------------------------ |
| item_id | string | null: false, foreign_key: true |
| user_id | string | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :users