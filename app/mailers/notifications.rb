class Notifications < ActionMailer::Base
  default from: "Notifications@DrDoLittle.com"

  def new_form_to_complete(user)
    @user = user
    @url = "New form's URL"
    mail(to: @user.email, subject: "#{@user.email}, you have a new form to complete! Cats!")
  end
end
