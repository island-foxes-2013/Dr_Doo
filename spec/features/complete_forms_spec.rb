 require 'spec_helper'

  feature "Complete Form" do
    scenario "as a user I want to complete a form" do
     visit complete_form_path(5)
     fill_in "Email", with: user.email
     fill_in "Full name", with: user.name
     fill_in "Date of birth", with: user.birthdate
     click_button 'Update Information'
     (current_path).to eq complete_forms_path(form)
     expect User.last.email == user.email 
    end

    scenario "as a user I want to input information into a field" do
       visit complete_form_path(5)
       fill_in "Email", with: user.email
       fill_in "Full name", with: user.name
       fill_in "Date of birth", with: user.birthdate
       # fill_in "Toothache", with: user.toothache
       click_button 'Update Answers'
       (current_path).to eq complete_forms_new_path
        expect User.last.email == user.email
    end

    scenario "as a user I want to review a complete form and edit a field" do
      visit complete_forms_show_path
      fill_in "Email", with: user.email
      fill_in "Full name", with: user.name
      fill_in "Date of birth", with: user.birthdate
      click_button 'Submit'
      (current_path).to eq forms_path
      expect User.last.email == user.email
    end
     
  end
