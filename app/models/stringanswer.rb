class Stringanswer < ActiveRecord::Base
	belongs_to :user
	belongs_to :field
  attr_accessible :field_id, :value

  validates :user_id, :field_id, :value, presence: true
end
