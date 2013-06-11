# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seq_keep, class: Kpt do
    kpt_type Kpt::KEEP
    sequence(:content) {|n| "keep #{n}"}
  end

  factory :seq_problem, class: Kpt do
    kpt_type Kpt::PROBLEM
    sequence(:content) {|n| "problem #{n}"}
  end

  factory :seq_try, class: Kpt do
    kpt_type Kpt::TRY
    sequence(:content) {|n| "try #{n}"}
  end
end
