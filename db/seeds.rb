require 'faker'

Like.delete_all
Comment.delete_all
Post.delete_all
User.delete_all
user = User.create!(name: 'John Doe', email: 'base@ex.com',
                    password: 'foobar', password_confirmation: 'foobar')

posts = ['Hello post']


10.times do |i|
  content = posts[0] + i.to_s
  Post.create(user_id: user.id, content: content)
end

p1 = Post.first
5.times do |i|
  content = "New comment with num #{i}"
  Comment.create!(user_id: user.id, post_id: p1.id, content: content)
  Comment.create!(user_id: user.id, post_id: (p1.id + 2), content: content)
end

10.times do
  like = Like.new(user_id: user.id)
  like.likeable = Post.first
  like.save
end

10.times do
  like = Like.new(user_id: user.id)
  like.likeable = Comment.first
  like.save
end

10.times do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email,
               password: 'foobar', password_confirmation: 'foobar')
end
