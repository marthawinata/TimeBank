# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :proposed_venue do
    meetup_id 1
    proposed_by_player 1
    description "MyText"
    venue_link "MyText"
  end
end
