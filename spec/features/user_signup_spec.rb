require 'spec_helper'

feature "User Sign Up" do
  before do
    visit root_url
  end

  let(:user) { build(:user) }
  subject { page }

  it { should have_link ("Sign Up") }

  scenario "creates an identity and visits the forms path", :js => true do
      visit root_path
      click_link("Sign Up")
      page.should have_content('Name')
      fill_in "Name", with: user.name
      fill_in "Email", with: user.email, :match => :prefer_exact
      fill_in "Password", with: user.password, :match => :prefer_exact
      fill_in "Password confirmation", with: user.password, :match => :prefer_exact
      find("#Sign_up", :visible => true)
      click_button "Sign Up"
      page.should have_content('Welcome')      
  end
  
  scenario "raises exception if user email or username is invalid", :js => true do
    visit root_path
    click_link("Sign Up")
    page.should have_content('Name')
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email, :match => :prefer_exact
    fill_in "Password", with: 'asdfhjka'
    fill_in "Password confirmation", with: 'asdf'
    click_button "Sign Up"
    expect(current_path).to eq root_path
  end 
  
  

end


  
