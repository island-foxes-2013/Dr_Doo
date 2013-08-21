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
  
  def build_field_data(form, answers)
    display_data = []
      form.fields.each do |field|
        answers.value.each do |answer|
        display_data << [answer[0], answer[1], field.element.size ] if answer[0] == field.label
      end
    end
    display_data
  end
end
