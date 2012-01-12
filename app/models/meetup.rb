class Meetup < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :available_boardgames
  has_many :boardgames, :through => :available_boardgames
  has_many :proposed_timings
  has_many :proposed_venues
  has_many :invitations
  belongs_to :host_user, :class_name => "User",:foreign_key => "host_user_id"

  LIMITED = 0
  OPEN = 1
  CLOSED = 2

  INVITATION_TYPE_DESCRIPTIONS = {
    LIMITED => "Limited - only host and invited users can invite",
    OPEN => "Open - everybody can join",
    CLOSED => "Closed - only host can invite"
  }

  def get_invitation_type(invitation_type_id)
    return INVITATION_TYPE_DESCRIPTIONS[invitation_type_id]
  end

  def invitation_type_description
    return get_invitation_type(self.invitation_type_id)
  end



  PUBLIC = 0
  PRIVATE = 1

  MEETUP_TYPE_DESCRIPTIONS = {
    PUBLIC => "Public meetup - viewable by everyone",
    PRIVATE => "Private meetup - viewable by invitees only",
  }

  def get_meetup_type(meetup_type_id)
    return MEETUP_TYPE_DESCRIPTIONS[meetup_type_id]
  end

  def meetup_type_description
    return get_meetup_type(self.meetup_type_id)
  end

  before_validation(:on => :create) do
    self.invitation_type_id ||= LIMITED
    self.meetup_type_id ||= PUBLIC
  end
  
end
