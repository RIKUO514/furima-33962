# DB 設計

## users

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nikename           | string              | null: false             |
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| fist_name          | string              | null: false             |
| list_name          | string              | null: false             |
| fist_name_kana     | string              | null: false             |
| list_name_kana     | string              | null: false             |
| birth_day          | date                | null: false             |

### Association

* has_many :items
* has_many :buyers

## items

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| description                         | text       | null: false       |
| category_id                         | integer    | null: false       |
| information_id                      | integer    | null: false       |
| shipping_fee_id                     | integer    | null: false       |
| area_id                             | integer    | null: false       |
| days_id                             | integer    | null: false       |
| price                               | integer    | null: false       |
| user                                | references | foreign_key: true |


### Association

- belongs_to :user
- has_one    :buyer

## buyers

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
  has_one    :buyer_address

## buyer_addresses

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefectures_id     | integer             | null: false             |
| municipalities     | string              | null: false             |
| address            | string              | null: false             |
| building           | string              |                         |
| tel                | string              | null: false             |
| buyer              | references          | foreign_key: true       |

### Association

belongs_to :buyer