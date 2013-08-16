require 'spec_helper'

describe Booleananswer do

  let(:user) { User.new }

  context "#new" do
    it "allows mass-assignment on value" do
      expect{ Booleananswer.new(value: true) }.not_to raise_error
    end

    it "should not allow mass-assignment on user_id" do
      expect{ Booleananswer.new(user_id: 1) }.to raise_error
      expect{ Booleananswer.new(user_id: user) }.to raise_error
    end

    it { should respond_to(:value) }
    it { should respond_to(:user_id) }
    it { should respond_to(:field_id) }
  end

  context "#save" do
    it "requires a valid value" do
      bool_answer = user.booleananswers.new(field_id: 1)
      expect(bool_ans).not_to be_valid
    end

    it "requires a valid field_id" do
      bool_answer = user.booleananswers.new(value: true)
      expect(bool_ans).not_to be_valid
    end

    it "requires a valid user_id" do
      bool_answer = Booleananswer.new(field_id: 1, value: false)
      expect(bool_ans).not_to be_valid
    end
  end
end
