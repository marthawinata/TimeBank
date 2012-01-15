class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def invitation_email(user,invitation)
    @user = user
    @invitation = invitation
    mail(:to => 'sheepeepee@gmail.com', :subject => "You have been invited to #{@invitation.meetup.name}")
  end
end
