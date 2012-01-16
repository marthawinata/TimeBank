class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def invitation_email(user,invitation)
    @user = user
    @invitation = invitation
    mail(:to => 'sheepeepee@gmail.com', :subject => "You have been invited to #{@invitation.meetup.name}")
  end

  def request_for_approval_email(approval)
    @approval = approval
    mail(:to => 'sheepeepee@gmail.com', :subject => "#{@approval.user.email} has asked you to approve to join #{@approval.meetup.name}")
  end
end
