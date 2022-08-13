class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :image, presence: true
  validates :bio, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  # A method that returns the 3 most recent posts for a given user.
  def self.recent_posts(user)
    Post.where(author_id: user.id).limit(3).order(created_at: :desc)
  end
end
