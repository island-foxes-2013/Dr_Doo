class CompleteFormsController < ApplicationController
  def show
    @form_answer = current_user.answers.find_or_create_by_form_id(params[:id])
    fields = @form_answer.form.fields
    fields.each do |field|
      @form_answer.value[field.label] = "" unless @form_answer.value.has_key?(field.label)
    end
  end

  
  def edit
    @form_answer = current_user.answers.find_or_create_by_form_id(params[:id])
    @form = Form.find(params[:id])
  end

  def update
    @form_answer = current_user.answers.find_or_create_by_form_id(params[:id])
    @form_answer.value = params[:fields]
    @form_answer.save
    redirect_to complete_form_path(@form_answer.form)
  end
end
