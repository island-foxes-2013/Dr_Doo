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
    form = user.forms.create(params[:form])
    params[:fields].each do |field|
      form.fields.create(element_id: field[:element_id], name: field[:name] )
    end
   
  end
end
