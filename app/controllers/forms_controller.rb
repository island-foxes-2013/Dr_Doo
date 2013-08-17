class FormsController < ApplicationController

	def index
	  # @Forms = Forms.all
    @user = User.last
	end

  def new
    @fields = Field.all
    @label = Label.new
  end
end
