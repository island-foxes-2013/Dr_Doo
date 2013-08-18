class Notifications < ActionMailer::Base
  default from: "notifications@drdoo.com"

  def new_form_to_complete(user)
    @user = user
    @url = "New form's URL"
    mail(to: @user.email, subject: "#{@user.name}, you have a new form to complete! Cats!")
  end
end
