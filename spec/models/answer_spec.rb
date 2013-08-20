require 'spec_helper'

describe Answer do

  let(:user) { FactoryGirl.build(:user) }
  let(:form) { FactoryGirl.build(:form) }
  let(:field) { FactoryGirl.build(:field) }

  context "#new" do
    it "should allow mass-assignment on value" do
      expect{ answer = Answer.new(value: "answer..?") }.not_to raise_error
    end

    it "should allow mass-assignment on user_id" do
      expect{ answer = Answer.new(user_id: 1) }.not_to raise_error
      expect{ answer = Answer.new(user_id: user) }.not_to raise_error
    end

    it "should not allow mass-assignment on form_id" do
      expect{ answer = Answer.new(form_id: 1) }.to raise_error
      expect{ answer = Answer.new(form_id: form) }.to raise_error
    end

    it "should allow mass-assignment on field_id" do
      expect{ answer = Answer.new(field_id: 1) }.not_to raise_error
      expect{ answer = Answer.new(field_id: field) }.not_to raise_error
    end

    it { should respond_to(:value) }
    it { should respond_to(:user_id) }
    it { should respond_to(:form_id) }
    it { should respond_to(:field_id) }
  end

  context "#save" do
    it "requires a valid value" do
      answer = form.answers.new(user_id: 1, field_id: field)
      expect(answer).not_to be_valid
    end

    it "requires a valid user_id" do
      answer = form.answers.new(field_id: 1, value: "value...?")
      expect(answer).not_to be_valid
    end

    it "requires a valid form_id" do
      answer = Answer.new(user_id: user, field_id: field, value: "value...?")
      expect(answer).not_to be_valid
    end

    it "requires a valid field_id" do
      answer = form.answers.new(user_id: user, value: "value...?")
      expect(answer).not_to be_valid
    end
  end
end
