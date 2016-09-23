FactoryGirl.define do
  factory :permission do
    sequence :name do |n|
      "permition_#{n}"
    end
    sequence :level do |n|
      @random_levels ||= (1..10).to_a.shuffle
      @random_levels[n]
    end
  end
end
