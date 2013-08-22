class CompleteFormsController < ApplicationController
  before_filter :authenticate_user!

  def show
    p "$" * 40
    p 'here we are'
    p params 

    render json: { success: true }
    # @form_answer = current_user.answers.find_or_create_by_form_id(params[:id])
    # fields = @form_answer.form.fields
    # fields.each do |field|
    #   @form_answer.value[field.label] = "" unless @form_answer.value.has_key?(field.label)
    # end
  end

  
  def edit
     @user = current_user
    @form_answer = @user.answers.find_or_create_by_form_id(params[:id])
    @form = Form.find(params[:id])
 
  @form_answer = @user.answers.find_or_create_by_form_id(params[:id])
  @fields = @form_answer.form.fields
  @fields.each do |field|
    @form_answer.value[field.label] = "" unless @form_answer.value.has_key?(field.label)
    end
  end

  def update
    @form_answer = current_user.answers.find_or_create_by_form_id(params[:id])
    params[:fields].each do |field|
      @form_answer.value[field['label']] = field['value'] 
    end
    @form_answer.save
    redirect_to forms_path
  end
end
