class Answer < ActiveRecord::Base
	serialize :value, ActiveRecord::Coders::Hstore
	attr_accessible :user_id, :form_id, :field_id, :value
	belongs_to :user
	belongs_to :form
end