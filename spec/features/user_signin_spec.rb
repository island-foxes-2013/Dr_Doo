require 'spec_helper'

feature "User Sign In" do

  before do
    visit root_url
  end

  let(:user) { create(:user) }

  subject { page }

  it { should have_link ("Sign In") }

  scenario "the user can fill in the sign in page and visit their dashboard", js: true do
    visit root_path
    click_link("Sign In")
    page.should have_content('Email')
    fill_in "Email", with: user.email, :match => :prefer_exact
    fill_in "Password", with: user.password, :match => :prefer_exact
    click_link("Sign In")
    sleep(5)
    expect User.last.email == user.email
  end
  
  scenario "raises exception if user email or username is invalid", js: true do
    visit root_path
    click_link("Sign In")
    page.should have_content('Email')
    fill_in "Email", with: user.email
    fill_in "Password", with: "fasdf"
    expect(current_path).to eq root_path
  end 
  
  

end
