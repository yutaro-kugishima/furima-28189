## users テーブル

This README would normally document whatever steps are necessary to get the
application up and running.
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| user_id               | string | null: false |
| nickname              | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name(kana)      | string | null: false |
| last_name(kana)       | string | null: false |
| birth_date            | string | null: false |
| email_address         | string | null: false |
| password              | string | null: false |

Things you may want to cover:
### Association

* Ruby version
- has_one  :address
- has_many :items
- has_many :item_transaction

* System dependencies
## address テーブル

* Configuration
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| prefecture | string | null: false |
| post_code  | string | null: false |
| city       | string | null: false |
| town       | string | null: false |
| building   | string | null: false |

* Database creation
### Association

* Database initialization
- has_one  :users
- has_one  :items
- has_many :item_transaction

* How to run the test suite
## items テーブル

* Services (job queues, cache servers, search engines, etc.)
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| item_id  | string | null: false |
| list     | string | null: false |
| detail   | string | null: false |
| edit     | string | null: false |
| delete   | string | null: false |

* Deployment instructions
### Association

* ...
- belongs_to :users
- has_one :address
- has_one :item_transaction

## item_transaction テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| item_id | string | null: false |
| user_id | string | null: false |

### Association

- has_one :items
- has_one :address
- belongs_to :users
- belongs_to :user