class Label < ActiveRecord::Base
	belongs_to :form
	belongs_to :field
	attr_accessible :field_id, :name
  # attr_accessible :title, :body

  validates :form_id, :field_id, :name, presence: true
end
