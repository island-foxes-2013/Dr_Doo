class Notification < ActiveRecord::Base
  attr_accessible :form_id, :recipient_email, :sender_id
  validates :form_id, :recipient_email, :sender_id, presence: true
 
  
  after_create :send_notification

  belongs_to :form
  belongs_to :sender, source :user

  def completed
    read_attribute(:completed) || update_attribute(:completed, false)
  end

  alias :completed? :completed # TODO LOOK UP SYNTAX

  def complete!
    self.completed = true
    NotificationMailer.form_complete_email(self).deliver
  end

  def send_notification
    NotificationMailer.new_form_notification(self).deliver
    Notifications.sent_form_notification(self).deliver
  end

end
