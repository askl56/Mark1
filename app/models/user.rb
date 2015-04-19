class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :topics
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_bookmarks, through: :likes, source: :bookmark

  def pending_invite?
    invitation_created_at && !invitation_accepted_at
  end

  def set_default_role
    self.role ||= :user
  end

  def like_for(bookmark)
    likes.find_by(:bookmark_id => bookmark.id)
  end

  scope :visible_to, -> (user) { user ? all : where(public: true) }

  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
