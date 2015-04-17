FactoryGirl.define do
  factory :topic do
    title "#HelloWorld"
    association :user
  end
end
