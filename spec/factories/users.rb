# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "test user"
    img_url "test_user.jpg"
    uid "12345"
  end

  factory :seq_user, class: User do
    sequence(:name) {|n| "user #{n}"}
    sequence(:img_url) {|n| "test_user_#{n}.jpg"}
    sequence(:uid) {|n| n.to_s}
  end
end
