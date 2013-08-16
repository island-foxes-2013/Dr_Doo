class Field < ActiveRecord::Base
	attr_accessible :default_label, :field_type
	has_many :labels
	has_many :forms, through: :labels
	has_many :stringanswers
	has_many :dateanswers
	has_many :integeranswers
	has_many :booleananswers
  # attr_accessible :title, :body
end
