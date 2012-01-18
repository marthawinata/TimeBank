class Approval < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user

  ACTIVE  = 0
  EXPIRED = 1

  APPROVAL_STATUS_DESCRIPTIONS = {
    ACTIVE  => "Active",
    EXPIRED => "Expired",
  }

  def get_approval_status(approval_status)
    return APPROVAL_STATUS_DESCRIPTIONS[approval_status]
  end

  def status_description
    return get_approval_status(self.status)
  end

end
