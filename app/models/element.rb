class Element < ActiveRecord::Base
	has_many :fields
  attr_accessible :size, :data_type, :label
end
