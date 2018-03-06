class Comment < ApplicationRecord
  default_scope { order(updated_at: :desc) }
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable

  validates :content, presence: true

end
