class FormsController < ApplicationController

	def index
		@fields = Field.all
		@label = Label.new
	end
end
