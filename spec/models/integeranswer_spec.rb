require 'spec_helper'

describe Integeranswer do

  let(:user) { User.new }

  context "#new" do
    it "allows mass-assignment on value" do
      expect{ int_ans = Integeranswer.new(value: 242) }.not_to raise_error
    end

    it "allows mass-assignment on field_id" do
      expect{ int_ans = Integeranswer.new(value: 242) }.not_to raise_error
    end

    it "doesn't allow mass-assignment on user_id" do
      expect{ int_ans = Integeranswer.new(user_id: 1) }.to raise_error
      expect{ int_ans = Integeranswer.new(user) }.to raise_error
    end

    it { should respond_to(:value) }
    it { should repsond_to(:user_id) }
    it { should repsond_to(:field_id) }

  end

  context "#save" do
    it "requires a valid value" do
      int_ans = user.intanswers.new(field_id: 1)
      expect(int_ans).not_to be_valid
    end

    it "requires a valid field_id" do
      int_ans = user.intanswers.new(value: 242)
      expect(int_ans).not_to be_valid
    end

    it "requires a valid user" do
      int_ans = Integeranswer.new(field_id: 1, value: 242)
      expect(int_ans).not_to be_valid
    end
  end
end
