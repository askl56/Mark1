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

FactoryGirl.define do
  factory :topic do
    title '#HelloWorld'
    association :user
  end
end
