require 'rails_helper'

describe IncomingController, :type => :controller do
  login_user


  it "processes a valid email to create a bookmark" do
    # 1. SETUP
    user = create(:user)
    topic = create(:topic)
    # 2. ACTION
    post :create, {sender: user.email, subject: topic.title, "stripped-text": "http://bloc.io"}
    # 3. EXPECT
    bookmark = user.bookmarks.last
    # expect a bookmark was created with right url
    expect(bookmark.url).to eq("http://bloc.io")
    # expect the bookmark is linked to the topic
    expect(bookmark.topic).to eq(topic)
  end
end
