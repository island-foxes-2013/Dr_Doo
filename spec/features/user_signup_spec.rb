require 'spec_helper'

feature "User Sign Up" do
  before do
    visit root_url
  end

  let(:user) { create(:user) }

  subject { page }

  it { should have_link ("Sign Up") }

  scenario "creates an identity and visits the forms path' do", :js => true do
      visit root_path
      click_link("Sign Up")
      fill_in "Name", with: user.name
      fill_in "Email", with: user.email, :match => :prefer_exact
      fill_in "Password", with: user.password, :match => :prefer_exact
      fill_in "Password confirmation", with: user.password, :match => :prefer_exact
      find("#Sign_up", :visible => true)
      click_button "Sign Up"
      find("#profile", :visible => true)
      expect User.last.email == user.email
  end
  
  scenario "raises exception if user email or username is invalid", :js => true do
    visit root_path
    click_link("Sign Up")
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email, :match => :prefer_exact
    fill_in "Password", with: 'asdfasdf'
    fill_in "Password confirmation", with: 'asdf'
    click_button "Sign Up"
    expect(current_path).to eq root_path
  end 
  
  

end


  
