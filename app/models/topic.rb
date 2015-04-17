class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history

  validates_length_of :title, :minimum => 1
  belongs_to :user
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  def self.search(search)
  	where('title like ?', "%#{search}%")
  end
end
