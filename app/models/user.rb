class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  has_many :answers
	has_many :forms

  validates :name, :email, :password, presence: true
  validates :email, length: { minimum: 8 }

  def contact_form(form)

    if form.fields.empty?
      contact_info = ['full_name', 'email', 'primary_phone', 'secondary_phone', 'fax', 'street_address', 'city', 'state', 'zip']
      form_elements = []
      Element.all.each do |element|
        contact_info.each do |label|
          if element.label == label
            form_elements << element
          end
        end
      end
      form_elements.each do |element|
        form.fields.create(element_id: element.id, label: element.label)
      end
      form_answer = self.answers.find_or_create_by_form_id(form.id)
      fields = form_answer.form.fields
      fields.each do |field|
        form_answer.value[field.label] = "" unless form_answer.value.has_key?(field.label)
      end
      form_answer.save
      return form_answer
    else
      form_answer = self.answers.find_or_create_by_form_id(form.id)
      fields = form_answer.form.fields
      fields.each do |field|
        form_answer.value[field.label] = "" unless form_answer.value.has_key?(field.label)
      end
      form_answer.save
      return form_answer
    end
  end
end
