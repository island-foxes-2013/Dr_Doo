class NotificationMailer < ActionMailer::Base
  default from: "Notifications@DrDoLittle.com"

  def form_new_email(notification)
    @form = Form.find(notification.form_id)
    @form_owner = User.find(notification.sender_id)
    @email = notification.recipient_email
    @url = "http://localhost:3000/forms/#{@form.id}"
    if !User.where(email: @email).empty?
      @form_recipient = User.where(email: @email).first
      mail(to: @email, subject: "#{@form_recipient.name}, #{@form_owner.name} has sent you a new form (#{@form.title}) to complete!")
    else
      mail(to: @email, subject: "#{@form_owner.name} has sent you a new form (#{@form.title}) to complete!")
    end
  end

  def form_sent_email(notification)
    @form = Form.find(notification.form_id)
    @form_owner = User.find(notification.sender_id)
    @email = @form_owner.email
    @url = "http://localhost:3000/forms/#{@form.id}"
    if !User.where(email: @email).empty?
      @form_recipient = User.where(email: @email).first
      mail(to: @email, subject: "#{@form_owner.name}, you have sent #{@form_recipient.name} your \"#{@form.title}\" form to complete!")
    else
      mail(to: @email, subject: "#{@form_owner.name}, you have sent #{@email} your \"#{@form.title}\" form to complete!")
    end
  end

  def form_completed_email(notification)
    @form = Form.find(notification.form_id)
    @form_owner = User.find(notification.sender_id)
    @email = @form_owner.email
    @url = "http://localhost:3000/forms/#{@form.id}"
    @form_recipient = User.where(email: @email).first
    mail(to: @email, subject: "#{@form_owner.name}, #{@form_recipient.name} has completed your \"#{@form.title}\" form!")
  end
end
