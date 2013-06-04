# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seq_event, class: Event do
    sequence(:title) {|n| "event #{n}"}
    start_at "2013-06-01 14:00:00"
    end_at "2013-06-01 17:00:00"
  end
end
