class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  def liked(bookmark)
    likes.where(bookmark_id: post.id).first
  end
end
