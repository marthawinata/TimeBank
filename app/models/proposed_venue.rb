class ProposedVenue < ActiveRecord::Base

  make_voteable
  belongs_to :meetup
  belongs_to :user, :class_name => "User", :foreign_key => :proposed_by_user

end
