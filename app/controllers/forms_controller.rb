class FormsController < ApplicationController

	def index
    @fields = Field.all.sort { |a,b| a.size <=> b.size }
		@label = Label.new
	end
end
