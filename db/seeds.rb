require 'faker'




# Update this hash with more form elements as needed.  This hash is the pool of ALL possible fields a form can be built with.
default_values = {full_name: ['string', 'span4'], date_of_birth: ['date', 'span2'], eye_color: ['string', 'span2'], 
	weight: ['integer', 'span1'], height: ['integer', 'span1'], allergies: ["string", 'span10'], 
	physician_name: ["string", 'span4'], pregnant: ["boolean", 'span2'], phone: ["integer", 'span3'], ssn: ['string', 'span2'], age: ['integer', 'span1'], 
	sex: ['string', 'span1'], street_address: ['string', 'span8'], city: ['string', 'span4'], state: ['string', 'span2'], 
	zip: ['integer', 'span2'], primary_phone: ['integer', 'span4'], secondary_phone: ['integer', 'span4'], email: ['string', 'span4'], 
	driver_license: ['string', 'span4'], how_did_you_hear_about_us?: ['string', 'span10'], fax: ['integer', 'span4'],}

# Create all the default form elements
default_values.each do |key, value|
	Element.create(label: key, data_type: value.first, size: value.last )
end

# Create some users
user1 = User.create(name: Faker::Name.name, email: 'dude@dude.com', password: '12345678', password_confirmation: '12345678')
user2 = User.create(name: Faker::Name.name, email: 'steve@me.com', password: '12345678', password_confirmation: '12345678')
user3 = User.create(name: Faker::Name.name, email: 'you@me.com', password: '12345678', password_confirmation: '12345678')
user4 = User.create(name: Faker::Name.name, email: 'me@me.com', password: '12345678', password_confirmation: '12345678')

# Create some forms associated with users as the form owners, NOT as form takers...
User.all.each do |user|
	user.forms.create(user_id: user.id, title: Faker::Lorem.sentence(word_count = 2))

end
# User 1 Form

# Create fields associated with each created form.  This will select from a random number or elements from the default values.
Form.all.each do |form|
	rand(8..15).times do
	  element = Element.all.sample
	  form.fields.create(element_id: element.id, label: element.label)
	end
end


user_profile = ['full_name', 'email', 'primary_phone', 'secondary_phone', 'fax', 'street_address', 'city', 'state', 'zip']
user_info = []
Element.all.each do |element|
	user_profile.each do |profile|
		if element.label == profile
			user_info << element
		end
  end
end

form = Form.create(user_id: 1, title: 'User Contact Info')

user_info.each do |element|
	form.fields.create(element_id: element.id, label: element.label)
end

user_profile_form = Form.find_by_title('User Contact Info')

	value = { }
		user_profile_form.fields.each do |field|
			boolean_type = [true, false]
			model_values = { string: Faker::Lorem.word, boolean: boolean_type.sample, integer: Faker::Number.digit, date: Date.today }
      value[field.label] = model_values[field.element.data_type.to_sym]
    end
		user_profile_form.answers.create(user_id: 1, value: value )

# The next methods are for creating answers to specific forms
# for some reason the date format method does not work anymore.  
# def randomdate
# 	Date.new(rand(1950..2013),rand(1..12,), rand(1..29))
# end

	Form.all.each do |form|
		user = User.all.sample
		value = { }
		form.fields.each do |field|
			boolean_type = [true, false]
			model_values = { string: Faker::Lorem.word, boolean: boolean_type.sample, integer: Faker::Number.digit, date: Date.today }
      value[field.label] = model_values[field.element.data_type.to_sym]
    end
		form.answers.create(user_id: user.id, value: value )
	end
