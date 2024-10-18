# README

# テーブル設計

## users テーブル
| Column             | Type   | Options     | 
| ------------------ | ------ | ----------- | 
| email              | string | null: false,unique: true | 
| name               | string | null: false | 
| profile            | text   | null: false | 
| occupation         | text   | null: false | 
| position           | text   | null: false | 
| encrypted_password | string | null: false,|

<<<<<<< HEAD
Association
・has_many :prototypes
・has_many :comments

=======
>>>>>>> d2137ed7b0fdf5c9ed3be317a4b355dfc9efa41d
## prototypes テーブル
| Column             | Type   | Options     | 
| ------------------ | ------ | ----------- | 
| title              | string | null: false | 
| catch_copy         | text   | null: false | 
| concept            | text   | null: false | 
| user               | references | null: false,foreign_key: true |

Association
・belongs_to :user
・has_many :comments


## comments テーブル
| Column             | Type   | Options     | 
| ------------------ | ------ | ----------- | 
| content            | text   | null: false | 
| prototype          | references | null: false,foreign_key: true | 
| user               | references | null: false,foreign_key: true |

<<<<<<< HEAD
Association
・belongs_to :prototype
・has_many :user
=======
>>>>>>> d2137ed7b0fdf5c9ed3be317a4b355dfc9efa41d
