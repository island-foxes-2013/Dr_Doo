class Integeranswer < ActiveRecord::Base
	attr_accessible :field_id, :value
	belongs_to :user
	belongs_to :field

  validates :user_id, :field_id, :value, presence: true
end
