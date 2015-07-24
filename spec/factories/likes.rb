# == Schema Information
#
# Table name: likes
#
#  id          :integer          not null, primary key
#  bookmark_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :like do
    bookmark
  end
end
