class Stringanswer < ActiveRecord::Base
	has_many :useranswers, :as => :answer
  belongs_to :field
  attr_accessible :field_id, :value

  validates :field_id, :value, presence: true
end
