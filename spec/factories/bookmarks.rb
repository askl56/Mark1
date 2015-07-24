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

require 'faker'

FactoryGirl.define do
  factory :bookmark do
    url Faker::Internet.url
    topic
  end
end
