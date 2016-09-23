FactoryGirl.define do
  factory :parent, class: User do
    name { FFaker::Name.name}
    email { FFaker::Internet.email}
    parent nil
  end
end
