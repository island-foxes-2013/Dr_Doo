class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    p "&&" * 90
    p params
    p build_resource(params[:user])
    if resource.save
      p "***" * 90
      p resource
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        return render json: { success: true, redirect_to: forms_path }
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        return render :json => {success: true}
      end 
    end
  end

  def sign_up(resource_name, resource)
    p "%%" * 90
    p resource
    sign_in(resource_name, resource)
  end

  def update
    super
  end
end 
