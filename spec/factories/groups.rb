# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seq_group, class: Group do
    sequence(:name) { |n| "group #{n}"}
    sequence(:description) {|n| "description #{n}"}
    sequence(:img_url) {|n| "http://test.com/#{n}.jpg"}
  end

  factory :group_event, class: Group, parent: :seq_group do
    events { [FactoryGirl.create(:seq_event)] }
    members { FactoryGirl.create_list(:seq_user, 10) }
  end
end
