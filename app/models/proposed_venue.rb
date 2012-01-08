class ProposedVenue < ActiveRecord::Base

  make_voteable
  belongs_to :meetup

end
