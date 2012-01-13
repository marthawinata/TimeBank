class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def invitation_email(user,meetup)
    @user = user
    @meetup = meetup
    mail(:to => 'marthawinata@gmail.com', :subject => "You have been invited to #{@meetup.name}")
  end
end
