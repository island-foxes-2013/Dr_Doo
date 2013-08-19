class Field < ActiveRecord::Base
	attr_accessible :form_id, :element_id, :label, :description
	belongs_to :form
	belongs_to :element
	has_many :answers

end
