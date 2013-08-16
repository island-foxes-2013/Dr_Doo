class Provider < ActiveRecord::Base
	has_many :forms
  # attr_accessible :title, :body
end
