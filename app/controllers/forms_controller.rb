class FormsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if current_user
      @user = current_user
      @request_notifications = Notification.where(recipient_email: @user.email, completed: false)
      @send_notifications = Notification.where(sender_id: @user.id, completed: false)
      @completed_notifications = Notification.where(sender_id: @user.id, completed: true)
      @form = @user.forms.find_or_create_by_title('User Contact Info')
      @form_answer = @user.contact_form(@form)
    else
      redirect_to root_path
    end
  end

  def show
    @form = Form.find(params[:id])
  end

  def new
    @form_elements = Element.all
    @field = Field.new
    @forms = Form.new
  end

  def create
    if params[:fields]
      @form = current_user.forms.create(params[:form])
      params[:fields].each do |field|
        element = Element.find(field[:element_id])
        @form.fields.create(element_id: element.id, label: element.label)
      end
      redirect_to form_path(@form)
    else
      redirect_to new_form_path
    end 
  end

  def update
    @form = Form.find(params[:id])
    @form.update_attributes(title: params[:form][:title])
    @form.fields.destroy_all
    params[:fields].each do |field|
      element = Element.find(field[:element_id])
      @form.fields.create(element_id: element.id, label: element.label)
    end 
    redirect_to form_path(@form)
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    redirect_to forms_path
  end

  def edit
    @form = Form.find(params[:id])
    @form_elements = Element.all
    @field = Field.new
  end
end
