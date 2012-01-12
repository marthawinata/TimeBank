class UserNotification < ActionMailer::Base
  default :from => "from@example.com"

  def invite_to_meetup(meetup_id, email, secret_url=nil)
    
  end
end
