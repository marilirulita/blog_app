require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :system do
  describe 'index page' do
    subject!(:jhon) { User.where(name: 'Jhon').first }

    before(:all) do
      Rails.application.load_seed
      driven_by(:selenium_chrome_headless)
    end

    it 'show user profile picture' do
      visit user_posts_path(jhon.id)
      expect(page).to have_css("img[src*='https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg']")
    end

    it 'show user name' do
      visit user_posts_path(jhon.id)
      expect(page).to have_content('Jhon')
    end

    it 'see number of posts user has written' do
      visit user_posts_path(jhon.id)
      expect(page).to have_content('0')
    end

    it 'see post title' do
      visit user_posts_path(jhon.id)
      expect(page).to have_content('Hello')
    end

    it 'see some of the posts body' do
      visit user_posts_path(jhon.id)
      expect(page).to have_content('This is my first post')
    end

    it 'see first comment on post' do
      visit user_posts_path(jhon.id)
      expect(page).to have_content('This is my first post')
    end

    it 'see how many comments on post' do
      visit user_posts_path(jhon.id)
      expect(page).to have_content('0')
    end

    it 'see how many likes on post' do
      visit user_posts_path(jhon.id)
      expect(page).to have_content('0')
    end

    it 'see a section for pagination' do
      visit user_posts_path(jhon.id)
      expect(page).to have_content('Paginations')
    end

    it 'when click on post, go to post show page' do
      visit user_posts_path(jhon.id)
      click_on 'Hello There'
      expect(page).to have_content('Hello There')
    end
  end
end
