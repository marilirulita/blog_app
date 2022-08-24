require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :system do
  describe 'show page' do
    subject!(:jhon) { User.where(name: 'Jhon').first }
    subject!(:post) { Post.where(author_id: jhon.id).last }

    before(:all) do
      driven_by(:selenium_chrome_headless)
    end

    it 'show user profile picture' do
      visit user_path(jhon)
      expect(page).to have_css("img[src*='https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg']")
    end

    it 'show user name' do
      visit user_path(jhon)
      expect(page).to have_content('Jhon')
    end

    it 'see the number of posts' do
      visit user_path(jhon)
      expect(page).to have_content('0')
    end

    it 'see the user bio' do
      visit user_path(jhon)
      expect(page).to have_content('Teacher from Mexico.')
    end

    it 'see the users first 3 posts' do
      visit user_path(jhon)
      expect(page).to have_content('This is my third post')
    end

    it 'see a button to see all posts' do
      visit user_path(jhon)
      expect(page).to have_link('See All Posts')
    end

    it 'when click user post, redirect to post show page' do
      visit user_path(jhon)
      click_link post.title
      expect(current_path).to eq(user_post_path(jhon, post))
    end

    it 'whe click see all posts, redirect to all users post index page' do
      visit user_path(jhon)
      click_link 'See All Posts'
      expect(current_path).to eq(user_posts_path(jhon))
    end
  end
end
