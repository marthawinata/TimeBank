# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :boardgame do
    bgg_id 1
    name "MyString"
    parent_boardgame_id 1
    is_standalone false
  end
end
