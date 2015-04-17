class Bookmark < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url, use: [:slugged, :history]

  def should_generate_new_friendly_id?
  	new_record?
  end

  belongs_to :topic
  belongs_to :user
  validates :url, :format => URI::regexp(%w(http https))
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def liked(bookmark)
    @bookmarks = Like.pluck(:bookmark_id)
  end
end
