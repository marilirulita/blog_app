require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'index page' do
    subject!(:jhon) { User.where(name: 'Jhon').first }

    before(:all) do
      driven_by(:selenium_chrome_headless)
    end

    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Jhon')
    end

    it 'show profile picture' do
      visit root_path
      expect(page).to have_css("img[src*='https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg']")
    end

    it 'see the number of posts' do
      visit root_path
      expect(page).to have_content('0')
    end

    it 'when click on user, redirect to user show page' do
      visit root_path
      click_on 'Jhon'
      expect(current_path).to eq(user_path(jhon))
    end
  end
end
