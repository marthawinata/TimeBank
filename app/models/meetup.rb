class Meetup < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_many :boardgames, :through => :boardgames_meetups
  has_many :proposed_timings
  has_many :proposed_venue
  
end
