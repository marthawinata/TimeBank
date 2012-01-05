# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collection do
    player_id 1
    boardgame_id 1
    bought_at "MyText"
  end
end
