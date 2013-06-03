# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seq_group, class: Group do
    sequence(:name) { |n| "group #{n}"}
  end
end
