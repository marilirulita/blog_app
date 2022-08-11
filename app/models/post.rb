class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  # A method that updates the posts counter for a user.
  def self.update_post_counter(user)
    user.increment!(:posts_counter)
  end

  # A method which returns the 5 most recent comments for a given post.
  def self.recent_comments(post)
    Comment.where(post_id: post.id).limit(5).order(created_at: :desc)
  end
end
