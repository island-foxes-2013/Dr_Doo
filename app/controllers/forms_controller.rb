class FormsController < ApplicationController
  # TODO-JW: this controller should probably be locked-down
  #          only to users who have authenticated, no?

	def index
    if current_user
      @user = current_user
      @user_contact_info = Form.find(@user.id).answers.first.value
    else
      redirect_to root_path
    end
	end

  def show
    # user = User.find(1)
    # @form = user.forms.first
    # @form_answers = @form.answers
  end

  def new
    @form_elements = Element.all
    @field = Field.new
    @forms = Form.new
  end

  def create_or_update_contact_info
    params inspect
  end

  def create
      p 'here I am _____________________________________'
      p params[:form]
      p params[:form][:title]

    user = User.find(1)
    @form = user.forms.create(params[:form])

     p params[:fields]['element_id']

     p params[:fields]['element_label']

    params[:fields].each do |field|
      p field
      # @form.fields.create(field)
    end
    redirect_to form_path(@form)
    # render json: { comment: "success" }


    # if @form.save
    #   # TODO-JW: do something more meaningful here
    #   render text: params.to_json
    # else
    #   # TODO-JW: do something more meaningful here
    #   render text: "ERROR!"
    # end
    # user = User.first
    # form = user.forms.create(params[:form])
    # params[:fields].each do |field|
    #   form.fields.create(element_id: field[:element_id], name: field[:name] )
    # end
  end
  
  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    redirect_to forms_path
  end

  def edit
    @form = Form.find(params[:id])
  end

end
