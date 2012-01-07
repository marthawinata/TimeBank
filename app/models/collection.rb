class Collection < ActiveRecord::Base
  belongs_to :boardgame
  belongs_to :player
  has_many :meetups, :through => :available_boardgames
end
