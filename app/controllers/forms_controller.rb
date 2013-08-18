class FormsController < ApplicationController

	def index
    @form_elements = Element.all #.sort { |a,b| a.size <=> b.size }
		@label = Field.new
		@form = Form.new
    @user = User.last
	end

  def new
    @form_elements = Element.all #.sort { |a,b| a.size <=> b.size }
    @label = Field.new
    @form = Form.new
  end

  def create
    user = User.first
    form = user.forms.create(title: 'test patient form')
    p '%' * 100
    p params
    p params[:form]
    p params[:string]
    p params[:integer]
  end
end
