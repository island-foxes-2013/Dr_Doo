module ApplicationHelper
  def current_user
    User.find_by_id(session[:user_id])
  end

  def resource_name
   :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
