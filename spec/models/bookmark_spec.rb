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

require 'rails_helper'

describe Bookmark, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:bookmark)).to be_valid
  end

  it '#save' do
    bookmark = Bookmark.new(
      url: 'http://bloc.io'
    )
    expect(bookmark).to be_valid
  end
end
