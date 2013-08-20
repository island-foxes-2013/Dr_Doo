class Form < ActiveRecord::Base
	attr_accessible :user_id, :title
	belongs_to :user
	has_many :fields
	has_many :answers
	accepts_nested_attributes_for :fields
  validates :title, :user_id, presence: true
end
