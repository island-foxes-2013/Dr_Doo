class Useranswer < ActiveRecord::Base
	belongs_to :answer, :polymorphic => true
	belongs_to :form
	belongs_to :user

	attr_accessible :form_id, :user_id, :answer_id, :answer_type
end
