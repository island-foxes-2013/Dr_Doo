class Label < ActiveRecord::Base
	belongs_to :form
	belongs_to :field
	attr_accessible :form_id, :field_id, :name
  # attr_accessible :title, :body
end
