require 'spec_helper'

feature "user Dashboard" do

  scenario "as a user I can create a new form" do 
    visit forms_path
    click_link("Create Form")
    expect(current_path).to eq new_form_path
  end

  scenario "as a user I can edit a form I created" do 
    pending
  end

  scenario "as a user I can delete a form" do 
   pending
  end
  
  scenario "as a user I can email a form to a Patient" do
    pending
  end
  
  scenario "as a user I want to be notified when a Patient form is returned" do
   pending
  end

  scenario "as a user I want to review a form sent from a Patient" do
    pending    
  end

  scenario "as a user I want to be notified when a Patient form is returned" do
   pending
  end

end
