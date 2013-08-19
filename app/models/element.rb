class Element < ActiveRecord::Base
	attr_accessible :name, :data_type, :size
	has_many :fields
	has_many :forms, through: :fields
	has_many :stringanswers
	has_many :dateanswers
	has_many :integeranswers
	has_many :booleananswers

  validates :name, :data_type, presence: true
end