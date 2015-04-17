require 'rails_helper'

describe Bookmark, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:bookmark).should be_valid
  end

  it '#save' do
    bookmark = Bookmark.new(
      url: 'http://bloc.io'
    )
    expect(bookmark).to be_valid
  end

  it 'is a URL' do
  	bookmark = Bookmark.new(
  		url: 'helloworld'
  		)
  	expect(bookmark).to raise_error
  end
end
