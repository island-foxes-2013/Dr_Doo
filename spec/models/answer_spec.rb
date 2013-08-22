require 'spec_helper'

describe Answer do

  let(:user) { FactoryGirl.create(:user) }
  let(:form) { FactoryGirl.build(:form) }
  let(:field) { FactoryGirl.build(:field) }
  let(:answer) { FactoryGirl.create(:answer)}

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

    it { should respond_to(:value) }
    it { should respond_to(:user_id) }
    it { should respond_to(:form_id) }
  end

  context "#save" do
    it "requires a valid value" do
      answer = form.answers.new( user_id: user )
      expect(answer).not_to be_valid
    end

    it "requires a valid user_id" do
      answer = form.answers.new( value: "value...?")
      expect(answer).not_to be_valid
    end

    it "requires a valid form_id" do
      answer = Answer.new(user_id: user, value: "value...?")
      expect(answer).not_to be_valid
    end
  end

  context "#mark_complete" do
    it "requires a notification to be marked complete" do
      user = User.create(name: 'Joe', email: 'hello@hello.com', password: '12345678', password_confirmation: '12345678')
      form = Form.new(user_id: user.id, title: 'hey there')
      form.save
      notification = form.notifications.create(recipient_email: user.email, sender_id: 1, completed: false)
      answer = form.answers.create( user_id: user.id, value: {key: 'value'})
      expect(answer.complete_outstanding_notifications.first.completed).to eq true
    end
  end
end
