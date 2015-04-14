class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end
