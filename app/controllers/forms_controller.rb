class FormsController < ApplicationController
  # TODO-JW: this controller should probably be locked-down
  #          only to users who have authenticated, no?

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
    @form = Form.new(params[:form])

    # TODO-JW-BEGIN: ---------------->8 snip, snip
    #   this code could be eliminated if you use
    #   accepts_nested_attributes_for on your model
    fields = params[:fields]
    fields.each do |field|
      @form.fields.build(field)
    end
    # TODO-JW-END: ---------------->8 snip, snip

    if @form.save
      # TODO-JW: do something more meaningful here
      render text: params.to_json
    else
      # TODO-JW: do something more meaningful here
      render text: "ERROR!"
    end
    # user = User.first
    # form = user.forms.create(params[:form])
    # params[:fields].each do |field|
    #   form.fields.create(element_id: field[:element_id], name: field[:name] )
    # end
  end
end
