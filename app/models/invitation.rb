class Invitation < ActiveRecord::Base
  belongs_to :meetup

  ACTIVE = 0
  EXPIRED = 1

  INVITATION_STATUS_DESCRIPTIONS = {
    ACTIVE => "Active",
    EXPIRED => "Expired",
  }

  def get_invitation_status(invitation_status_id)
    return INVITATION_STATUS_DESCRIPTIONS[invitation_status_id]
  end

  def invitation_status_description
    return get_invitation_status(self.invitation_status_id)
  end

  def expire
    self.status = Invitation::EXPIRED
    self.save
  end

end
