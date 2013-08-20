require 'spec_helper'

describe CompleteFormsController do

  let(:user) { FactoryGirl.build(:user) }
  let(:form) { FactoryGirl.build(:form, user_id: user)}

  it "should display the current user's form" do
    visit "/forms/#{form.id}"
    page.should have_content form.title
  end
end
