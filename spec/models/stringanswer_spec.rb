require 'spec_helper'

describe Stringanswer do

  let(:user) { User.new }
  
  context "#new" do
    it "allows mass-assignment on value" do
      expect{ Stringanswer.new(value: "Island Foxes") }.not_to raise_error
    end

    it "allows mass-assignment on field_id" do
      expect{ Stringanswer.new(field_id: 1) }.not_to raise_error
      expect{ Stringanswer.new(field) }.not_to raise_error
    end

    it "doesn't allow mass-assignment on user_id" do
      expect{ Stringanswer.new(user_id: 1) }.to raise_error
      expect{ Stringanswer.new(user) }.to raise_error
    end

    it{ should respond_to(:value) }
    it{ should respond_to(:field_id) }
    it{ should respond_to(:user_id) }
  end

  context "#save" do
    it "requires a valid value" do
      str_ans = user.stringanswers.new(field_id: 1)
      expect(str_ans).not_to be_valid
    end

    it "requires a valid field_id" do
      str_ans = user.stringanswers.new(value: "Island Foxes")
      expect(str_ans).not_to be_valid
    end

    it "requires a valid user" do
      str_ans = Stringanswer.new(field_id: 1, value: "Island Foxes")
      expect(str_ans).not_to be_valid
    end
  end
end
