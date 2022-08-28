class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true

  # A method that updates the comments counter for a post.
  after_create do
    update_comment_counter
  end

  def update_comment_counter
    if post.comments_counter.nil?
      post.update(comments_counter: 1)
    else
      post.increment!(:comments_counter)
    end
  end

  def as_json(_options = {})
    super(only: [:text])
  end
end
