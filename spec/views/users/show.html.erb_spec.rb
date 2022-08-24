require "rails_helper"

RSpec.describe "users/show.html.erb", type: :system do
  describe "show page" do
    before do
      # rubocop:disable Layout/LineLength
      @first_user = User.create(name: "Bob",
                                image: "https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg", bio: "Peruvian Chef.", posts_counter: 0)
      @first_post = Post.create(author_id: @first_user.id, title: "Hello", text: "This is my first post",
                                comments_counter: 0, likes_counter: 0)
      # rubocop:enable Layout/LineLength
    end

    it "show user profile picture" do
      visit user_path(@first_user)
      expect(page).to have_css("img[src*='https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg']")
    end

    it "show user name" do
      visit user_path(@first_user)
      expect(page).to have_content("Bob")
    end

    it "see the number of posts" do
      visit user_path(@first_user)
      expect(page).to have_content("0")
    end

    it "see the user bio" do
      visit user_path(@first_user)
      expect(page).to have_content("Peruvian Chef.")
    end

    it "see the users first 3 posts" do
      visit user_path(@first_user)
      expect(page).to have_content("This is my first post")
    end

    it "see a button to see all posts" do
      visit user_path(@first_user)
      expect(page).to have_link("See All Posts")
    end

    it "when click user post, redirect to post show page" do
      visit user_path(@first_user)
      click_link "Hello"
      expect(current_path).to eq(user_post_path(@first_user, @first_post))
    end

    it "whe click see all posts, redirect to all users post index page" do
      visit user_path(@first_user)
      click_link "See All Posts"
      expect(current_path).to eq(user_posts_path(@first_user))
    end
  end
end
