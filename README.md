## users テーブル

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

### Association

- has_one  :address
- has_many :items
- has_many :item_transaction

## address テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| prefecture | string | null: false |
| post_code  | string | null: false |
| city       | string | null: false |
| town       | string | null: false |
| building   | string | null: false |

### Association

- has_one  :users
- has_one  :items
- has_many :item_transaction

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| item_id  | string | null: false |
| list     | string | null: false |
| detail   | string | null: false |
| edit     | string | null: false |
| delete   | string | null: false |

### Association

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
