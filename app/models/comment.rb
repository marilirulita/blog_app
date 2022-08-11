class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # A method that updates the comments counter for a post.
  def self.update_comment_counter(post)
    Post.find(post.id).increment!(:comments_counter)
  end
end
