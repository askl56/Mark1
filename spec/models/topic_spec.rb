require 'rails_helper'

describe Topic, type: :model do

  it "has a valid factory" do
    FactoryGirl.create(:topic).should be_valid
  end


  it '#save' do
    topic = Topic.new(
      title: 'helloworld'
    )
    expect(topic).to be_valid
  end

  it 'title must be at least 1 character' do
    topic = Topic.new(
      title: ''
    )
    topic.valid?
    expect(topic).to be_invalid
  end
end