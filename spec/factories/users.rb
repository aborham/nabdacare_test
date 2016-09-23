FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name}
    email { FFaker::Internet.email}
    parent
  end
end
