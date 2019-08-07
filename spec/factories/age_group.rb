FactoryBot.define do
  factory :age_group do
    sequence(:group) { |n| "#{n}-#{n+1}" }
  end
end
