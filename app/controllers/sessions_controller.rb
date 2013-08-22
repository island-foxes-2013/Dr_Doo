class SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate(scope: resource_name)
    if resource
      scope = Devise::Mapping.find_scope!(resource_name)
      resource ||= resource_name
      sign_in(scope, resource) unless warden.user(scope)== resource
      render json: { success: true, redirect_to: forms_path }
    else
      render status: :unauthorized, json: { success: false, errors: "Invalid username or password."  }
    end
  end
end
