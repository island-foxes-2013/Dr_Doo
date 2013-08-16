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

default_values = {name: 'string', date_of_birth: 'date', eye_color: 'string', gender: 'string', weight: 'integer',
	height: 'integer', allergies: "string", physician_name: "string", pregnant: "boolean", phone: "integer"}


	default_values.each do |key, value|
		Field.create(default_label: key, field_type: value)
	end

providers = [provider1, provider2, provider3]
	providers.each do |provider|
		provider.forms.create(provider_id: provider.id, name: Faker::Lorem.sentence(word_count = 2))
	end

all_fields = Field.all
all_forms = Form.all

all_forms.each do |form|
	all_fields.each do |field|
		form.labels.create(field_id: field.id, name: field.default_label )
	end
end


