FactoryGirl.define do
  factory :permission do
    sequence :name do |n|
      "permition_#{n}"
    end
    level 1
  end
end
