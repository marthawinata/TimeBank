class Meetup < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_many :collections, :through => :available_boardgames
  has_many :proposed_timings
  has_many :proposed_venue
  
end
