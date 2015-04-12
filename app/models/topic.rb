class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  def self.search(search)
  	where('name like ?', "%#{search}%")
  end
end
