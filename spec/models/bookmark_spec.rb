require 'rails_helper'

describe Bookmark, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:bookmark)).to be_valid
  end

  it '#save' do
    bookmark = Bookmark.new(
      url: 'http://bloc.io'
    )
    expect(bookmark).to be_valid
  end
end
