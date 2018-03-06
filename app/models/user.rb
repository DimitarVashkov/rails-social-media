class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :name, presence: true

  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  after_create :send_admin_mail

  def send_admin_mail
    WelcomeMailer.welcome_email(self).deliver
  end

  def remove_friend(user, friend)
    user.friends.destroy(friend)
  end

  def feed(user)
    friends_ids = User.find(user.id).friends.pluck(:friend_id)
    friends_ids << user.id
    Post.where("user_id IN (?)", friends_ids)
    #feed = User.find(user.id).posts.all.order('posts.updated_at DESC').
     #   includes(:comments).order('comments.updated_at DESC')

  end

end
