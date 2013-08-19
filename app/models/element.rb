class Element < ActiveRecord::Base
	has_many :fields
  attr_accessible :size, :data_type, :label

  validates :data_type, :label, presence: true
end
