class Integeranswer < ActiveRecord::Base
	belongs_to :user
	belongs_to :field
  # attr_accessible :title, :body
end
