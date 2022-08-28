class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :image, presence: true
  validates :bio, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :role, presence: true

  after_create :generate_api_token

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  private

  def generate_api_token
    self.api_token = Devise.friendly_token
    save
  end
end
