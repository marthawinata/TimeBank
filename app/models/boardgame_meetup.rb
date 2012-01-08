class BoardgameMeetup < ActiveRecord::Base
  has_one :player
  has_one :boardgame
  has_one :meetup
  make_voteable
end
