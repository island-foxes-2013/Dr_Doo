class FormsController < ApplicationController
  # TODO-JW: this controller should probably be locked-down
  #          only to users who have authenticated, no?

	def index
    if current_user
      @user = current_user
      @request_notifications = Notification.where(recipient_email: @user.email, completed: false)
      @send_notifications = Notification.where(sender_id: @user.id, completed: false)
      
      @form_answer = @user.answers.find_or_create_by_form_id(Form.find_by_title('User Contact Info').id)
      fields = @form_answer.form.fields
      fields.each do |field|
        @form_answer.value[field.label] = "" unless @form_answer.value.has_key?(field.label)
      end
      

    
      # @form_fields = @form.fields
      # @contact_form = form.answers.where(user_id: @user.id)
      # if !@contact_form.empty?
      #   @contact_form = form.fields
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

  def create_or_update_contact_info
  end

  def create
    @form = current_user.forms.create(params[:form])
    params[:fields].each do |field|
      element = Element.find(field[:element_id])
      @form.fields.create(element_id: element.id, label: element.label)
    end 
    redirect_to form_path(@form)
  end
  
  def destroy
    @form = Form.find(params[:id])
    @form_notifications = Notification.where(form_id: @form.id)
    @form_notifications.destroy_all
    @form.destroy
    redirect_to forms_path
  end

  def edit
    @form = Form.find(params[:id])
    @form_elements = Element.all
    @field = Field.new
  end
end
