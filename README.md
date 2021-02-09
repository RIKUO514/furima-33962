# DB 設計

## users

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nikename           | string              | null: false             |
| email              | string              | foreign_key: tru        |
| password           | string              | null: false             |
| fist_name          | text                | null: false             |
| list_name          | text                | null: false             |
| fist_name_kana     | text                | null: false             |
| list_name_kana     | test                | null: false             |
| birth_day          | string              | null: false             |

### Association

* has_many :items
* has_many :buyers

## items

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| image                               | string     | null: false       |
| name                                | text       | null: false       |
| bescription                         | text       | null: false       |
| category_id                         | text       | null: false       |
| information_id                      | text       | null: false       |
| shipping_fee_id                     | text       | null: false       |
| area_id                             | text       | null: false       |
| days_id                             | text       | null: false       |
| price                               | text       | null: false       |


### Association

- belongs_to :users
- belongs_to :buyers

## buyers

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | text       | null: false       |
| purchased   | string     | foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users
  belongs_to :buyer_address

## buyer_address

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefectures        | string              | null: false             |
| municipalitise_id  | string              | null: false             |
| address            | string              | null: false             |
| building           | string              |                         |
| tel                | text                | null: false             |

### Association
