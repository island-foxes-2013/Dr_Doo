class FormsController < ApplicationController

	def index
	  @forms = Forms.all
	end

  def new
    @fields = Field.all
    @label = Label.new
  end
end
