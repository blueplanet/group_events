# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_user do
    event nil
    user nil
    join_type 1
  end
end
