# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :proposed_timing do
    meetup_id 1
    proposed_by_user 1
    proposed_date "2012-01-06"
    proposed_time "2012-01-06 09:16:21"
  end
end
