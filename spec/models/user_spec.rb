require 'spec_helper'

describe User do
  context "#new" do
    it "allows mass-assignment of email" do
      expect{ user = User.new(email: "example@email.com") }.not_to raise_error
    end

    it "allows mass-assignment of email" do
      expect{ user = User.new(name: "Fox McCloud") }.not_to raise_error
    end

    it "allows mass-assignment of password" do
      expect{ user = User.new(password: "password") }.not_to raise_error
    end

    it { should respond_to(:email) }
  end

  context "#save" do
    it "requires a valid email" do
      user = User.new(password: "password", password_confirmation: "password")
      expect(user).not_to be_valid
    end

    it "requires a valid password" do
      user = User.new(name: "Fox McCloud", email: "email@email.com", password_confirmation: "password")
      expect(user).not_to be_valid
    end

    it "requires a valid name" do
      user = User.new(email: "fox@starfox.com", password: "doabarrelroll", password_confirmation: "doabarrelroll")
      expect(user).not_to be_valid
    end

    it "requires a password validation" do
      user = User.new(name: "Fox McCloud", password: "password", password_confirmation: "password")
      emails = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      emails.each do |invalid_email|
        user.email = invalid_email
        user.should be_invalid
      end
    end

    it "requires a password >= 8 chars long" do
      let(:user) { user.password = @user.password_confirmation = "a" * 7 }
      it { should be_invalid }
    end
  end
end

# Add in email format validation
# it "should be invalid" do
#       emails = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
#       emails.each do |invalid_email|
#         user.email = invalid_email
#         user.should be_invalid
#       end
#     end

# TODO: Add in password format validation
# describe "with a password that's too short" do
#     let(:user) { user.password = @user.password_confirmation = "a" * 5 }
#     it { should be_invalid }
#   end