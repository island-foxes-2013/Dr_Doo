require 'spec_helper'

describe Dateanswer do

  let(:user) { User.new }
  let(:field) { Field.new }

  context "#new" do
    it "allows mass-assignment on value" do
      expect{ Dateanswer.new(value: Date.today) }.not_to raise_error
    end

    it "allows mass-assignment on field_id" do
      expect{ Dateanswer.new(field_id: 1) }.not_to raise_error
      expect{ Dateanswer.new(field) }.not_to raise_error
    end

    it "doesn't allow mass-assignment on user_id" do
      expect{ Dateanswer.new(user_id: 1) }.to raise_error
      expect{ Dateanswer.new(user) }.to raise_error
    end

    it { should respond_to(:value) }
    it { should respond_to(:user_id) }
    it { should respond_to(:field_id) }
  end

  context "#save" do
    it "requires a valid value" do
      date_ans = user.dateanswers.new(field_id: 1)
      expect(date_ans).not_to be_valid
    end

    it "requires a valid field_id" do
      date_ans = user.dateanswers.new(value: Date.today)
      expect(date_ans).not_to be_valid
    end

    it "requires a valid user" do
      date_ans = Dateanswer.new(field_id: 1, value: Date.today)
      expect(date_ans).not_to be_valid
    end
  end
end
