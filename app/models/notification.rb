class Notification < ActiveRecord::Base
  attr_accessible :form_id, :recipient_email, :sender_id
  validates :form_id, :recipient_email, :sender_id, presence: true
  after_initialize :default_values
  
  def default_values
    self.completed = false if self.completed.nil?
  end
end
