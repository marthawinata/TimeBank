class ProposedTiming < ActiveRecord::Base
  belongs_to :meetup
  make_voteable
end
