class ProposedTiming < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user, :class_name => "User", :foreign_key => :proposed_by_user

  make_voteable
end
