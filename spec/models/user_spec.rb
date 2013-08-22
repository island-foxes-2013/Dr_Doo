require 'spec_helper'

describe User do
  context "#new" do
    it "allows mass-assignment of email" do
      expect{ user = User.new(email: "example@email.com") }.not_to raise_error
    end

    it "allows mass-assignment of email" do
      expect{ user = User.new(name: "Fox McCloud") }.not_to raise_error
    end

    it "allows mass-assignment of password" do
      expect{ user = User.new(password: "password") }.not_to raise_error
    end

    it { should respond_to(:email) }
  end

  context "#save" do
    it "requires a valid email" do
      user = User.new(password: "password", password_confirmation: "password")
      expect(user).not_to be_valid
    end

    it "requires a valid password" do
      user = User.new(name: "Fox McCloud", email: "email@email.com", password_confirmation: "password")
      expect(user).not_to be_valid
    end

    it "requires a valid name" do
      user = User.new(email: "fox@starfox.com", password: "doabarrelroll", password_confirmation: "doabarrelroll")
      expect(user).not_to be_valid
    end

    it "requires a password validation" do
      user = User.new(name: "Fox McCloud", email: 'hhh@.com', password: "password", password_confirmation: "password")
        expect(user).not_to be_valid
    end

    it "requires a password >= 8 chars long" do
      user = User.new(name: 'buddy', email: 'buddy@buddy.com', password: '123456', password_confirmation: '123456')
      expect(user).not_to be_valid
    end
  end

  context "#contact_form" do
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
    
    it "requires a contact information form to be created per user" do
      user = User.create(name: 'joe', email: 'joe@joe.com', password: "password", password_confirmation: "password")
      form = user.forms.find_or_create_by_title('User Contact Info')
      p form
      form_answer = user.contact_form(form)
      p form_answer
      # expect(user).not_to be_valid
    end
  end
end

