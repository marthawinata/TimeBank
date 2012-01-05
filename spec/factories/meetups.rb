# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meetup do
    host_player_id 1
    confirmed_date "2012-01-06"
    confirmed_time "2012-01-06 09:13:03"
    confirmed_venue "MyText"
    meetup_type "MyString"
    venue_link "MyText"
    invitation_type "MyString"
  end
end
