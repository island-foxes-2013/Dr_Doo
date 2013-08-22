require 'spec_helper'

describe Notification do

  let!(:user) { FactoryGirl.create(:user, id: 1, name: "Star Wolf", email: "wolf@starwolf.gov", password: "password", password_confirmation: "password") }
  let!(:user) { FactoryGirl.create(:user, id: 2, name: "Star Fox", email: "fox@cornera.gov", password: "password", password_confirmation: "password") }
  let!(:form) { FactoryGirl.create(:form, id: 1, user_id: 1, title: "Corneria Non-Disclosure Agreement") }
  let!(:email) { "fox@corneria.gov" }

  context "#new" do
    it "should allow mass-assignment on sender_id" do
      expect{ notification = Notification.new(sender_id: 1) }.not_to raise_error
    end

    it "should allow mass-assignment on recipient_email" do
      expect{ notification = Notification.new(recipient_email: email) }.not_to raise_error
    end

    it "should not allow mass-assignment on form_id" do
      expect{ notification = Notification.new(form_id: 1) }.to raise_error
      expect{ notification = Notification.new(form_id: form) }.to raise_error
    end

    it "should allow mass-assignment on completed_id" do
      expect{ notification = Notification.new(completed: true) }.to raise_error
    end

    it { should respond_to(:form_id) }
    it { should respond_to(:sender_id) }
    it { should respond_to(:recipient_email) }
    it { should respond_to(:completed) }
  end

  context "#save" do
    it "requires a valid form_id" do
      notification = Notification.new(sender_id: 1, recipient_email: email)
      expect(notification).not_to be_valid
    end

    it "requires a valid sender_id" do
      notification = form.notifications.new(recipient_email: email)
      expect(notification).not_to be_valid
    end

    it "requires a valid recipient_email" do
      notification = form.notifications.new(sender_id: 1)
      expect(notification).not_to be_valid
    end

    it "does not require a valid completed" do
      notification = form.notifications.new(sender_id: 1, recipient_email: email)
      expect(notification).to be_valid
    end

    it "should have completed set to false by default" do
      notification = form.notifications.new(sender_id: 1, recipient_email: email)
      expect(notification.completed).to eq false
    end

    it "should return it's completed value when 'complete?' is called" do
      notification = form.notifications.new(sender_id: 1, recipient_email: email)
      current_complete = notification.completed
      expect(notification.complete?).to eq current_complete
    end

    it "should change the value of completed to true when 'complete!' is called" do
      expect{ notification.complete! }.to change(notification.complete?).from(false).to(true)
      expect{ notification.complete! }.to change(notification.completed).from(false).to(true)
    end
  end
end
