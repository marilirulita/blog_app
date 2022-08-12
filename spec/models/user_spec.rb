require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Monica', image: 'https://www.lecturas.com/medio/2022/07/31/monica-dominguez_aa2c8735_1280x720.jpg', bio: '38 years old journalist', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'image should be present' do
    subject.image = nil
    expect(subject).to_not be_valid
  end

  it 'bio should be present' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.posts_counter = 2
    expect(subject).to be_valid
  end
end
