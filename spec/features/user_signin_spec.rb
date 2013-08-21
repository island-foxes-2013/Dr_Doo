require 'spec_helper'

feature "Provider Sign In" do
  before do
    visit root_url
  end

  let(:user) { create(:user) }
  let(:nopassword_user) { create(:nopassword_user) }

  subject { page }

  it { should have_link ("Sign In") }

  scenario "the sign up link takes the user to sign in page" do
    click_link("Sign In")
    expect(current_path).to eq new_user_session_path
  end

  scenario "the user can fill in the sign in page" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_link("Sign In")
    expect(current_path).to eq new_user_session_path
    expect User.last.email == user.email
  end
  
  scenario "raises exception if user email or username is invalid" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "fasdf"
    expect(current_path).to eq new_user_session_path
  end 
  
  

end
