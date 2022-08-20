class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # A method that updates the likes counter for a post.
  after_create do
    update_like_counter
  end

  def update_like_counter
    if post.likes_counter.nil?
      post.update(likes_counter: 1)
    else
      post.increment!(:likes_counter)
    end
  end
end
