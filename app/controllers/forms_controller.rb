class FormsController < ApplicationController
  # TODO-JW: this controller should probably be locked-down
  #          only to users who have authenticated, no?

	def index
    if current_user
      @user = current_user
      @request_notifications = Notification.where(recipient_email: @user.email, completed: false)
      @send_notifications = Notification.where(sender_id: @user.id, completed: false)
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
    @form.destroy
    redirect_to forms_path
  end

  def edit
    @form = Form.find(params[:id])
  end
end
