class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :history
  belongs_to :user
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  def self.search(search)
  	where('name like ?', "%#{search}%")
  end
end
