# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seq_event, class: Event do
    sequence(:title) {|n| "event #{n}"}
    date Date.today
    time "14:00 - 16:00"
    sequence(:content) {|n| "content #{n}"}
    sequence(:location) {|n| "location #{n}"}
  end

  factory :event_users, class: Event, parent: :seq_event do
    participants { FactoryGirl.create_list(:seq_user, 10) }
  end
end
