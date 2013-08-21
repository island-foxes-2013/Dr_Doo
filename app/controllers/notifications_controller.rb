class NotificationsController < ApplicationController

  def create
    notification = current_user.forms.find_by_id(params[:form_id]).notifications.create(recipient_email: params[:email])
    notification.sender = current_user

    if notification.save
      respond_to do |format|
        format.html { redirect_to forms_path }
        format.js   { render json: notification }
      end
    else
      flash[:error] = "ERROR!"
    end
  end
end

    notification.sender = current_user