# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld'
)
member.skip_confirmation!
member.save!

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password:  Faker::Lorem.characters(10),
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

15.times do 
  Topic.create!(
    title:      Faker::Lorem.sentence,
    user:       users.sample
    )
end
topics = Topic.all

50.times do 
  bookmark = Bookmark.create!(
    user:     users.first,
    topic:    topics.first,
    url:      Faker::Internet.url
    )
end
bookmarks = Bookmark.all

50.times do
  like = Like.create!(
    user:     users.sample,
    bookmark:   bookmarks.sample
    )
end
likes = Like.all