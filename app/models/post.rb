class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  # A method that returns all posts from recent to first.
  scope :ordered_posts, ->(user) { where('author_id = ?', user).order(created_at: :desc) }

  # A method that updates the posts counter for a user.
  def self.update_post_counter(user)
    user.increment!(:posts_counter)
  end

  # A method which returns the 5 most recent comments for a given post.
  def self.recent_comments(post)
    Comment.where(post_id: post.id).limit(5).order(created_at: :desc)
  end
end
