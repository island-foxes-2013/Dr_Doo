class Answer < ActiveRecord::Base
	serialize :value, ActiveRecord::Coders::Hstore
	attr_accessible :user_id, :value
	belongs_to :user
	belongs_to :form

  validates :user_id, :form_id, :value, presence: true
  attr_accessible :value
  store_accessor :value
end
