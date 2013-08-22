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
      user = User.new(name: "Fox McCloud", email: 'hhh@.com', password: "password", password_confirmation: "password")
        expect(user).not_to be_valid
    end

    it "requires a password >= 8 chars long" do
      user = User.new(name: 'buddy', email: 'buddy@buddy.com', password: '123456', password_confirmation: '123456')
      expect(user).not_to be_valid
    end
  end
end