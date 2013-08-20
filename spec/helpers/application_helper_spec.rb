require 'spec_helper'

describe ApplicationHelper do
  describe "current user" do

    let(:user) { FactoryGirl.build(:user) }

    it "returns the logged in user" do
      log_in(user)
      expect(current_user).to eq user
    end

    it "does not return a user if none is logged in" do
      pending
    end
  end
end
