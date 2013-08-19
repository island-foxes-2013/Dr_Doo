class CompleteFormsController < ApplicationController
  def new
  end

  def save_all_answers
    # p params.inspect
 # Answer.transaction do |t|
    # normal ActiveRecord code to create new answers
    # params[:answers].each do |a|
    # Answer.create!(a)
    # end
 # end
  end

  def show
    @form = Form.find(params[:id])
    # user = User.find(1)
    # @form = User.forms.first
    @form_answers = @form.answers.first.value
  end

  
  def edit
  end

  def put
  end

  def destroy
  end
end
