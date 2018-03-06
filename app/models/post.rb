class Post < ApplicationRecord
  default_scope { order(updated_at: :desc) }
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable

  validates :content, presence: true
end
