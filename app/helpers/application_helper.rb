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
  
  def build_field_data(answer_values)
    display_data = []
      form.fields.each do |field|
        answer_values.each do |answer|
        display_data << {label: answer.key, value: answer.value, size: field.element.size }
      end
    end
    display_data
  end
end
