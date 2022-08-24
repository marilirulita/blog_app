require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :system do
  describe 'show page' do
    # before do
    #   # rubocop:disable Layout/LineLength
    #   @first_user = User.create(name: 'Bob',
    #                             image: 'https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg', bio: 'Peruvian Chef.', posts_counter: 0)
    #   @first_post = Post.create(author_id: @first_user.id, title: 'Hello', text: 'This is my first post',
    #                             comments_counter: 0, likes_counter: 0)
    #   # rubocop:enable Layout/LineLength
    #   Comment.create(post_id: @first_post.id, author_id: @first_user.id, text: 'Hi Tom!')
    # end

    subject!(:jhon) { User.where(name: 'Jhon').first }
    subject!(:post) { Post.where(author_id: jhon.id).first }

    before(:all) do
      driven_by(:selenium_chrome_headless)
    end

    it 'see post title' do
      visit user_post_path(jhon.id, post.id)
      expect(page).to have_content('Hello')
    end

    it 'see who wrote the post' do
      visit user_post_path(jhon.id, post.id)
      expect(page).to have_content('Jhon')
    end

    it 'see how many comments on post' do
      visit user_post_path(jhon.id, post.id)
      expect(page).to have_content('0')
    end

    it 'see how many likes on post' do
      visit user_post_path(jhon.id, post.id)
      expect(page).to have_content('0')
    end

    it 'see the post body' do
      visit user_post_path(jhon.id, post.id)
      expect(page).to have_content('This is my first post')
    end

    it 'see the username of each comment' do
      visit user_post_path(jhon.id, post.id)
      expect(page).to have_content('Jhon')
    end

    it 'see the comment each commentor left' do
      visit user_post_path(jhon.id, post.id)
      expect(page).to have_content('Hi Tom!')
    end
  end
end
