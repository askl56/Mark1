# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#

class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history

  validates_length_of :title, minimum: 1
  belongs_to :user
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  def self.search(search)
    where('title like ?', "%#{search}%")
  end
end
