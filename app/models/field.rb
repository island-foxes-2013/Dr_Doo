class Field < ActiveRecord::Base
	attr_accessible :form_id, :element_id, :name
	belongs_to :form
	belongs_to :element
	has_many :booleananswers
	has_many :dateanswers
	has_many :stringanswers
	has_many :integeranswers
end
