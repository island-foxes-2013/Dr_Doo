 require 'spec_helper'

  feature "Review Form" do
    scenario "as a user I want to review an empty form" do
     visit forms_path(form)
    end

    scenario "as a user I want to input information into a field" do
     pending
    end

    scenario "as a user I want to review a complete form" do
     pending
    end
     
  end



  # feature "Complete Form" do
  #   scenario "as a user I want to complete a form" do
  #    visit complete_forms_new_path
  #    fill_in "Email", with: user.email
  #    fill_in "Full name", with: user.name
  #    fill_in "Date of birth", with: user.birthdate
  #    # fill_in "Toothache" with: user.toothache
  #    click_button 'Update Answers'
  #    (current_path).to eq complete_forms_new_path
  #    expect User.last.email == user.email 
  #   end