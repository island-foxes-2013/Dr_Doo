require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user = User.create
provider1 = Provider.create
provider2 = Provider.create
provider3 = Provider.create

default_values = {full_name: ['string', 'span4'], date_of_birth: ['date', 'span2'], eye_color: ['string', 'span2'], gender: ['string', 'span1'], 
	weight: ['integer', 'span1'], height: ['integer', 'span1'], allergies: ["string", 'span10'], 
	physician_name: ["string", 'span4'], pregnant: ["boolean", 'span2'], phone: ["integer", 'span3'], ssn: ['string', 'span2'], age: ['integer', 'span1'], 
	sex: ['string', 'span1'], home_address: ['string', 'span8'], city: ['string', 'span4'], state: ['string', 'span2'], 
	zip: ['integer', 'span2'], primary_phone: ['integer', 'span4'], secondary_phone: ['integer', 'span4'], email: ['string', 'span4'], 
	driver_license: ['string', 'span4'], how_did_you_hear_about_us?: ['string', 'span10'] }

default_values.each do |key, value|
	Field.create(label: key, brand: value.first, size: value.last )
end

providers = [provider1, provider2, provider3]
	providers.each do |provider|
		provider.forms.create(provider_id: provider.id, name: Faker::Lorem.sentence(word_count = 2))
	end

all_fields = Field.all
all_forms = Form.all

all_forms.each do |form|
  all_fields.each do |field|
	  form.labels.create(field_id: field.id, name: field.label )
  end
end