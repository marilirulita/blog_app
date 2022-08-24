require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :system do
  describe 'index page' do
    before do
      # rubocop:disable Layout/LineLength
      @first_user = User.create(name: 'Bob',
                                image: 'https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg', bio: 'Peruvian Chef.', posts_counter: 0)
      @first_post = Post.create(author_id: @first_user.id, title: 'Hello', text: 'This is my first post',
                                comments_counter: 0, likes_counter: 0)
      # rubocop:enable Layout/LineLength
    end

    it 'show user profile picture' do
      visit user_path(@first_user)
      expect(page).to have_css("img[src*='https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg']")
    end

    it 'show user name' do
      visit user_path(@first_user)
      expect(page).to have_content('Bob')
    end

    it 'see number of posts user has written' do
      visit user_path(@first_user)
      expect(page).to have_content('0')
    end

    it 'see post title' do
      visit user_path(@first_user)
      expect(page).to have_content('Hello')
    end

    it 'see first comment on post' do
      visit user_path(@first_user)
      expect(page).to have_content('This is my first post')
    end

    it 'see how many comments on post' do
      visit user_path(@first_user)
      expect(page).to have_content('0')
    end

    it 'see how many likes on post' do
      visit user_path(@first_user)
      expect(page).to have_content('0')
    end

    it 'when click on post, go to post show page' do
      visit user_path(@first_user)
      click_on 'Hello'
      expect(page).to have_content('This is my first post')
    end
  end
end
