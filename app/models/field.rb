class Field < ActiveRecord::Base
	attr_accessible :form_id, :element_id, :name
	belongs_to :element
  has_and_belongs_to_many :forms
end
