class Notifications < ActionMailer::Base
  default from: "Notifications@DrDoLittle.com"

  def new_form_to_complete(form_owner, form_recipient, form)
    @form = form
    @form_owner = form_owner
    @form_recipient = form_recipient
    @url = "http://localhost:3000/forms/#{form.id}"
    mail(to: @form_recipient.email, subject: "#{@form_recipient.email}, you have a new form to complete!")
  end

  def sent_form_notification(form_owner, form_recipient, form)
    @form = form
    @form_owner = form_owner
    @form_recipient = form_recipient
    @url = "http://localhost:3000/forms/#{form.id}"
    mail(to: @form_owner.email, subject: "#{@form_owner.email}, you've sent #{@form_recipient.email} your #{@form.name} form to complete!")
  end

  def complete_form_notification(form_owner, form_recipient, form
    @form = form
    @form_owner = form_owner
    @form_recipient = form_recipient
    @url = "http://localhost:3000/forms/#{form.id}"
    mail(to: @form_owner.email, subject: "#{@form_owner.email}, #{@form_recipient.email} has completed your #{@form.name} form!")
  end
end
