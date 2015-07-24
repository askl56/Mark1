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

class Like < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :user
end
