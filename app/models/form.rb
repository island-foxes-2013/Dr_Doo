class Form < ActiveRecord::Base
	attr_accessible :user_id, :title
	belongs_to :user
	has_many :elements, through: :fields
  has_and_belongs_to_many :fields
  validates :title, :user_id, presence: true
end
