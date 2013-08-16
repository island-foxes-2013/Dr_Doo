class User < ActiveRecord::Base
	has_many :stringanswers
	has_many :dateanswers
	has_many :integeranswers
	has_many :booleananswers
  # attr_accessible :title, :body
end
