# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  url        :string
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  slug       :string
#

class Bookmark < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    new_record?
  end

  belongs_to :topic
  belongs_to :user
  validates :url, format: URI.regexp(%w(http https))
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
end
