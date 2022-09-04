# README

 ## users テーブル
 
|column               |type              |options                                              |
|--------------------|-------------------|-----------------------------------------------------|
|nickname            |string             |null: false                                          |
|email               |string             |null: false   unique:true                            | 
|encrypted_password  |string             |null: false                                          |
|last_name_kannzi    |string             |null: false                                          |
|first_name_kannzi   |string             |null: false                                          |
|last_name_katakana  |string             |nill: false                                          |
|first_name_katakana |string             |nill: false                                          |
|birthday            |date               |nill: false                                          |

### Association

has_many :comments
has_many :items 
has_many : purchases

 ## items　テーブル
 
|column               |type              |options                                |
|--------------------|-------------------|---------------------------------------|
|name                |string             |null: false                            |
|explanation         |text               |null: false                            |
|category_id         |integer            |null: false                            |
|situation_id        |integer            |nill: false                            |
|load_id             |integer            |nill: false                            |
|area_id             |integer            |nill: false                            |
|deadline_id         |integer            |nill: false                            |
|price               |integer            |nill: false,                           |
|user                |references         |null: false, foreign_key: true         |

### Association

has_many :comments
has_one : purchase
belongs_to :user


 ## comments　テーブル
 
|column               |type              |options                        |
|--------------------|-------------------|-------------------------------|
|content             |text               |null: false                    |
|user                |references         |null: false, foreign_key: true | 
|item                |references         |null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item 


 ## purchases　テーブル
 
|column               |type              |options                        |
|--------------------|-------------------|-------------------------------|
|user                |references         |null: false, foreign_key: true | 
|item                |references         |null: false, foreign_key: true |

### Association

has_one :shipping
belongs_to :user
belongs_to :item 

 ##  shippingテーブル
 
|column               |type              |options                        |
|--------------------|-------------------|-------------------------------|
|post_code           |string             |null: false                    |
|area_id             |integer            |null: false                    |
|municipality        |string             |null: false                    |
|address             |string             |null: false                    |
|building            |string             |                               |
|phone_namber        |string             |null: false                    |
|purchases           |references         |null: false, foreign_key: true |


### Association

belongs_to :purchase