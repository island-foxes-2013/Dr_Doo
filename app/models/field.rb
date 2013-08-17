class Field < ActiveRecord::Base
	attr_accessible :form_id, :element_id, :name
	belongs_to :form
	belongs_to :element
end
