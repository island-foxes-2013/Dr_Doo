class FormsController < ApplicationController

	def index
    @form_elements = Element.all #.sort { |a,b| a.size <=> b.size }
		@label = Field.new
		@form = Form.new
	end
end
