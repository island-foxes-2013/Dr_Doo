class Answer < ActiveRecord::Base
	serialize :value, ActiveRecord::Coders::Hstore
	attr_accessible :user_id, :value
	belongs_to :user
	belongs_to :form

  validates :user_id, :form_id, :value, presence: true
  store_accessor :value

  after_create :complete_outstanding_notifications


  def complete_outstanding_notifications
    form.notifications.where(email: user.email).each(&:complete!)
  end
end
