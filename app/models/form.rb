class Form < ActiveRecord::Base
	attr_accessible :provider_id, :name
	belongs_to :provider
	has_many :labels
	has_many :fields, through: :labels
  # attr_accessible :title, :body
end
