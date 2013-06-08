# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "test user"
    img_url "test_user.jpg"
    uid "12345"
  end
end
