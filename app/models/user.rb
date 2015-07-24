# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default("")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  role                   :integer
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#  public                 :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, if: :new_record?

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
    likes.find_by(bookmark_id: bookmark.id)
  end

  scope :visible_to, -> (user) { user ? all : where(public: true) }

  devise :invitable, :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
end
