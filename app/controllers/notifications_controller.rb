class NotificationsController < ApplicationController

  def create
    notification = current_user.forms.find_by_id(params[:form_id]).notifications.create(recipient_email: params[:email])
    notification.sender_id = current_user.id

    if notification.save
      response = {recipient_email: notification.recipient_email, form_title: Form.find(notification.form_id).title}
      respond_to do |format|
        format.html { redirect_to forms_path }
        format.js   { render json: response }
      end
    else
      response = {error: "Please enter a valid email."}
      respond_to do |format|
        format.html { redirect_to forms_path }
        format.js   { render json: response }
      end
    end
  end

  def destroy
    success = Notification.find(params[:id]).destroy
    if success
      render json: { success: true, notification: "#" + params[:id].to_s }
    else
      render json: { success: false }
    end
  end
end
