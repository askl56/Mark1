FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    name { Faker::Name }
    sequence(:email) { |n| "johndoe#{n}@example.com" }
    password 'please123'

    trait :admin do
      role 'admin'
    end
  end
end
