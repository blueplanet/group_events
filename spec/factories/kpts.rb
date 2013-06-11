# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :kpt do
    kpt_type 1
    content "MyText"
    event nil
  end
end
