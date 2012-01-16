# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :approval do
    meetup_id 1
    user_id 1
    is_approved false
    status 1
  end
end
