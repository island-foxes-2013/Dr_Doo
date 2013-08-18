 require 'spec_helper'

  feature "Complete Form" do
    scenario "as a user I want to complete a form" do
     pending #visit complete_forms_new_path
             #fill_in "Email", with: user.email
             #fill in "Name", with: user.name
             #fill in "Birthdate", with: user.birthdate
             #fill in "Toothache" with: user.toothache
             #click_button 'Submit'
             #(current_path).to eq forms_path
             #expect User.last.email == user.email
             #expect 
    end

    scenario "as a user I want to input information into a field" do
     pending #visit complete_forms_new_path
             #fill_in "Email", with: user.email
             #fill in "Name", with: user.name
             #fill in "Birthdate", with: user.birthdate
             #fill in "Toothache" with: user.toothache
             #click_button 'Submit'
             #(current_path).to eq forms_path
             # expect User.last.email == user.email
    end

    scenario "as a user I want to review a complete form and edit a field" do
     pending # visit complete_forms_show_path
             #fill_in "Email", with: user.email
             #fill in "Name", with: user.name
             #fill in "Birthdate", with: user.birthdate
             #click_button 'Submit'
             #(current_path).to eq forms_path
             # expect User.last.email == user.email
    end
     
  end
