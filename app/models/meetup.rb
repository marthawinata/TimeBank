class Meetup < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :available_boardgames
  has_many :boardgames, :through => :available_boardgames
  has_many :proposed_timings
  has_many :proposed_venues
  has_many :invitations
  belongs_to :host_user, :class_name => "User",:foreign_key => "host_user_id"
  has_many :approvals

  

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

  scope :made_public, where(:meetup_type_id => Meetup::PUBLIC).order('updated_at DESC')

  # user can only join if meetup is open, or they are invited
  def can_join?(user)
    return false if self.users.include?(user)
    return true
  end

  def can_invite_others?(user)
    return true if self.invitation_type_id == Meetup::OPEN
    return true if self.invitation_type_id == Meetup::LIMITED && self.users.include?(user)
    return true if self.invitation_type_id == Meetup::CLOSED && self.host_user == user
    return false
  end

  def need_approval?(user)
    self.invitations.where(:email => user.email).each do |invite|
      return false
    end
    return true
  end
end
