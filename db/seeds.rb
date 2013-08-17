require 'faker'

user1 = User.create
user2 = User.create
user3 = User.create

default_values = {full_name: ['string', 'span5'], ssn: ['string', 'span3'], age: ['integer', 'span1'], sex: ['string', 'span1'], 
	home_address: ['string', 'span10'], city: ['string', 'span4'], state: ['string', 'span3'], zip: ['integer', 'span3'],
	primary_phone: ["integer", 'span5'], secondary_phone: ['integer', 'span5'], email: ['string', 'span6'], 
	driver_license: ['string', 'span4'], how_did_you_hear_about_us?: ['string', 'span10'] }
	 

default_values.each do |key, value|
	Element.create(name: key, data_type: value.first, size: value.last )
end

users = [user1, user2, user3]
	users.each do |user|
		user.forms.create(user_id: user.id, title: Faker::Lorem.sentence(word_count = 2))
	end

all_elements = Element.all
all_forms = Form.all

all_forms.each do |form|
  all_elements.each do |element|
	  form.fields.create(element_id: element.id, name: element.name )
  end
end

# DO NOT DELETE!!! - Use the below hash for a full selection of database elements... 
# default_values = {full_name: ['string', 'span4'], date_of_birth: ['date', 'span2'], eye_color: ['string', 'span2'], gender: ['string', 'span1'], 
# 	weight: ['integer', 'span1'], height: ['integer', 'span1'], allergies: ["string", 'span10'], 
# 	physician_name: ["string", 'span4'], pregnant: ["boolean", 'span2'], phone: ["integer", 'span3'], ssn: ['string', 'span2'], age: ['integer', 'span1'], 
# 	sex: ['string', 'span1'], home_address: ['string', 'span8'], city: ['string', 'span4'], state: ['string', 'span2'], 
# 	zip: ['integer', 'span2'], primary_phone: ['integer', 'span4'], secondary_phone: ['integer', 'span4'], email: ['string', 'span4'], 
# 	driver_license: ['string', 'span4'], how_did_you_hear_about_us?: ['string', 'span10'] }