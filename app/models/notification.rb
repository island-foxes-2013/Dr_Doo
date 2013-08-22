class Notification < ActiveRecord::Base
  attr_accessible :recipient_email, :sender_id, :completed
  validates :form_id, :recipient_email, :sender_id, presence: true
   
  after_create :send_notification

  belongs_to :form

  def complete?
    self.completed
  end

  def complete!
    self.completed = true
    self.save
    NotificationMailer.form_completed_email(self).deliver
  end

  def send_notification
    NotificationMailer.form_new_email(self).deliver
    NotificationMailer.form_sent_email(self).deliver
  end
end