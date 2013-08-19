class FormsController < ApplicationController

	def index
		@field = Field.new
		@form = Form.new
    @user = User.last
	end

  def show
    user = User.find(1)
    @form = user.forms.first
    @form_answers = @form.answers.first.value
  end

  def new
    @form_elements = Element.all
    @field = Field.new
    @form = Form.new
  end

  def create
    p params
    # user = User.first
    # form = user.forms.create(params[:form])
    # params[:fields].each do |field|
    #   form.fields.create(element_id: field[:element_id], name: field[:name] )
    # end
  end
end
