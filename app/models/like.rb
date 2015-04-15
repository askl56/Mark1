class Like < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :user

  def self.bookmarks
  	Bookmark.where( id: pluck(:bookmark_id) )
  end

  def self.users
  	User.where( id: pluck(:user_id) )
  end

  def bookmark
  	Bookmark.find(bookmark_id)
  end

  def user
	User.find(user_id)
  end
end
