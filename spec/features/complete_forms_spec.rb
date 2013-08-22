 require 'spec_helper'

 feature "User wants to Complete a Form" do
   before do
      visit complete_form_path(5)
    end

    let(:user) { create(:user) }

    subject { page }

    it { should have_link ("Create Form") }

    scenario "as a user I want to complete a form" do
     visit complete_form_path(5)
     fill_in "Email", with: user.email, :match => :prefer_exact
     fill_in "Full name", with: user.name
     fill_in "Date of birth", with: user.birthdate
     click_button 'Update Information'
     expect(current_path).to eq forms_path
     expect User.last.email == user.email 
    end

    scenario "as a user I want to input information into a field" do
       visit complete_form_path(5)
       fill_in "Email", with: user.email, :match => :prefer_exact
       fill_in "Full name", with: user.name
       fill_in "Date of birth", with: user.birthdate
       # fill_in "Toothache", with: user.toothache
       click_button 'Update Answers'
       expect(current_path).to eq forms_path
        expect User.last.email == user.email
    end

    scenario "as a user I want to review a complete form and edit a field" do
      visit complete_forms_show_path
      fill_in "Email", with: user.email, :match => :prefer_exact
      fill_in "Full name", with: user.name
      fill_in "Date of birth", with: user.birthdate
      click_button 'Submit'
      expect(current_path).to eq forms_path
      expect User.last.email == user.email
    end
     
  end
