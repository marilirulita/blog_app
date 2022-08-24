require "rails_helper"

RSpec.describe "User", type: :system do
  describe "index page" do
    before do
      # rubocop:disable Layout/LineLength
      @first_user = User.create(name: "Bob",
                                image: "https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg", bio: "Peruvian Chef.", posts_counter: 0)
      # rubocop:enable Layout/LineLength
    end

    it "shows the right content" do
      visit root_path
      expect(page).to have_content("Bob")
    end

    it "show profile picture" do
      visit root_path
      expect(page).to have_css("img[src*='https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg']")
    end

    it "see the number of posts" do
      visit root_path
      expect(page).to have_content("0")
    end

    it "when click on user, redirect to user show page" do
      visit root_path
      click_on "Bob"
      expect(current_path).to eq(user_path(@first_user))
    end
  end
end
