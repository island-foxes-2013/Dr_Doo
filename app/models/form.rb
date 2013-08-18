class Form < ActiveRecord::Base
	attr_accessible :user_id, :title
	belongs_to :user
	has_many :elements, through: :fields
	has_many :useranswers
  validates :title, :user_id, presence: true
end
