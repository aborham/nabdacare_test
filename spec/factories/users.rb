FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name}
    email { FFaker::Internet.email}
    parent_id 1
  end
end
