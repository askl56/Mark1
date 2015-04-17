require 'rails_helper'

RSpec.describe IncomingController, :type => :controller do


  it "processes a valid email to create a bookmark" do
    # 1. SETUP
    user = create(:user)
    topic = create(:topic)
    bookmark = create(:bookmark)
    # 2. ACTION
    post :create, {sender: user.email, subject: "#"+topic.title, "body-plain": "http://bloc.io"}
    # 3. EXPECT
    bookmark = user.bookmarks.last
    # expect a bookmark was created with right url
    expect(bookmark.url).to_eq("http://bloc.io")
    # expect the bookmark is linked to the topic
    expect(bookmark.topic).to_eq(topic)
  end
end
