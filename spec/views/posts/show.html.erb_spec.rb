require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :system do
  describe 'show page' do
    subject!(:jhon) { User.where(name: 'Jhon').first }
    subject!(:post) { Post.where(author_id: jhon.id).last }

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
      expect(page).to have_content('This is my fourth post')
    end

    it 'see the username of each comment' do
      visit user_post_path(jhon.id, post.id)
      expect(page).to have_content('Jhon')
    end

    it 'see the comment each commentor left' do
      visit user_post_path(jhon.id, post.id)
      expect(page).to have_content('Hi Steve!')
    end
  end
end
