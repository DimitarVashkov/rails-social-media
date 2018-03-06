# README

## Models:

### User
- has_many :posts
- has_many :comments
- has_many :likes

### Post
- belongs_to :user
- has_many :comments
- has_many :likes, as: :likeable

### Comment
- belongs_to :user
- belongs_to :post
- has_many :likes, as: :likeable

### Like
- belongs_to :user
- belongs_to :likeable, polymorphic: true
- [Polymorphic assoc Rails guide](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations)

### Friendship
- Done by following: [Post about mutual friendship](https://dankim.io/mutual-friendship-rails/)