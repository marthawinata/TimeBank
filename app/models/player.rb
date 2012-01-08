class Player < ActiveRecord::Base
  has_many :games, :through => :game_sessions
  has_and_belongs_to_many :meetups
  
  validates :name, :presence => true, :on => :create
end
