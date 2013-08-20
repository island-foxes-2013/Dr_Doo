class Notifications < ActionMailer::Base
  default from: "Notifications@DrDoLittle.com"

  def new_form_to_complete(form_owner, recipient_email, form)
    @form = form
    @form_owner = form_owner
    @email = recipient_email
    @url = "http://localhost:3000/forms/#{form.id}"
    if !User.where(email: @email).empty?
      @form_recipient = User.where(email: @email).first
      mail(to: @email, subject: "#{@form_recipient.name}, #{@form_owner.name} has sent you a new form (#{@form.title}) to complete!")
    else
      mail(to: @email, subject: "#{@form_owner.name} has sent you a new form (#{@form.title}) to complete!")
    end
  end

  def sent_form_notification(form_owner, recipient_email, form)
    @form = form
    @form_owner = form_owner
    @email = recipient_email
    @url = "http://localhost:3000/forms/#{form.id}"
    p !User.where(email: @email).empty?
    p @email
    if !User.where(email: @email).empty?
      p User.where(email: @email)
      @form_recipient = User.where(email: @email).first
      mail(to: @email, subject: "#{@form_owner.name}, you have sent #{@form_recipient.name} your \"#{@form.title}\" form to complete!")
    else
      mail(to: @email, subject: "#{@form_owner.name}, you have sent #{@email} your \"#{@form.title}\" form to complete!")
    end
  end

  def complete_form_notification(form_owner, recipient_email, form)
    @form = form
    @form_owner = form_owner
    @email = recipient_email
    @url = "http://localhost:3000/forms/#{form.id}"
    if !User.where(email: @email).empty?
      @form_recipient = User.where(email: @email).first
      mail(to: @email, subject: "#{@form_owner.name}, #{@form_recipient.name} has completed your \"#{@form.title}\" form!")
    else
      mail(to: @email, subject: "#{@form_owner.name}, #{@email} has completed your \"#{@form.title}\" form!")
    end
  end
end
