require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author_id: 133, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it "title should be present" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "Title must not exceed 250 characters." do
    subject.title = "this is a veryyy long text thet could exceed the 250 characters long so I will keep writting until I get bigger text that only 250 charactersssss: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec nisl sed est lobortis eleifend eu quis purus. Integer pulvinar lectus in eros tempus, at convallis lorem pharetra."
    expect(subject).to_not be_valid
  end

  it "text should be present" do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it "CommentsCounter must be an integer greater than or equal to zero." do
    subject.comments_counter = -3
    expect(subject).to_not be_valid
  end
  
  it "LikesCounter must be an integer greater than or equal to zero." do
    subject.likes_counter = -4
    expect(subject).to_not be_valid
  end
end
