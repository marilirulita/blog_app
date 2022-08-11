class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  # A method that returns the 3 most recent posts for a given user.
  def self.recent_posts(user)
    Post.where(author_id: user.id).limit(3).order(created_at: :desc)
  end
end
