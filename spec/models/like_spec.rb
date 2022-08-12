require 'rails_helper'

RSpec.describe Like, type: :model do
  subject {Like.new(post_id: 1, author_id: 2)}

  before {subject.save}

  it "post id should be present" do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it "author id should be present" do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

end