class AvailableBoardgame < ActiveRecord::Base
  belongs_to :user
  belongs_to :boardgame
  belongs_to :meetup
  make_voteable
end
