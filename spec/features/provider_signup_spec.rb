require 'spec_helper'

feature "Provider Sign Up" do
  before do
    visit root_url
  end

  let(:user) { create(:user) }

  subject { page }

  it { should have_link ("Sign Up") }

  scenario "the sign up link takes the user to sign up page" do
    click_link("Sign Up")
    expect(current_path).to eq new_user_registration_path
  end

  scenario "the user can fill in the sign up page" do
    visit new_user_registration_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign up"
    expect User.last.email == user.email
  end
  
  scenario "raises exception if Provider email or username is invalid" do
    visit new_user_registration_path
    fill_in "Email", with: user.email
    fill_in "Password", with: 'fasdfff'
    expect(current_path).to eq new_user_registration_path
  end 
  
  

end


  
