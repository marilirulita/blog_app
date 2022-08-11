class Like < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post

  #A method that updates the likes counter for a post.
  def self.update_like_counter(post)
    Post.find(post.id).increment!(:likes_counter)
  end
end