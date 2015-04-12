class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :topics

  def set_default_role
    self.role ||= :user
  end

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id, user_id: id).first
  end

  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
