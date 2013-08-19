require 'spec_helper'

describe Form do

  let(:user) { FactoryGirl.build(:user) }

  context "#new" do

    it "should allow mass-assignment on title" do
      expect{ form = Form.new(title: "Standard Liability Form") }.not_to raise_error
    end

    it "should not allow mass-assignment on user" do
      expect{ form = Form.new(user: 1) }.to raise_error
      expect{ form = Form.new(user: user) }.to raise_error
    end

    it { should respond_to(:title) }
    it { should respond_to(:user_id) }
  end

  context "#save" do
    it "requires a valid name" do
      form = user.forms.new
      expect(form).not_to be_valid
    end

    it "requires a valid provider" do
      form = Form.new(title: "Standard Liability Form")
      expect(form).not_to be_valid
    end
  end
end
