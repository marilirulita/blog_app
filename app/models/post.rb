class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  after_create do
    update_post_counter
  end

  # A method that updates the posts counter for a user.
  def update_post_counter
    if author.posts_counter.nil?
      author.update(posts_counter: 1)
    else
      author.increment!(:posts_counter)
    end
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
