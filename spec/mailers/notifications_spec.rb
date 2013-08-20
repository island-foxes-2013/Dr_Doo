require "spec_helper"

describe Notifications do

  let(:form_owner) { FactoryGirl.build(:user) }
  let(:form_recipient) { FactoryGirl.build(:user) }
  let(:form) { FactoryGirl.build(:form) }

  describe "new form to complete" do
    it "should render without error" do
      expect{Notifications.new_form_to_complete(form_owner, form_recipient, form)}.not_to raise_error
    end

    describe "after successfully rendering" do
      before(:each) do
        @mailer = Notifications.new_form_to_complete(form_owner, form_recipient, form)
      end

      it "should have the recipient's name" do
        @mailer.body.should have_content "#{form_recipient.name}"
      end

      it "should have the sender's name" do
        @mailer.body.should have_content "#{form_owner.name}"
      end

      it "should have the form's title" do
        @mailer.body.should have_content "#{form.title}"
      end

      it "should deliver successfully" do
        expect{ Notifications.deliver(@mailer) }.not_to raise_error
      end

      it "should be added to the delivery queue" do
        expect{ Notifications.deliver(@mailer) }.to change(ActionMailer::Base.deliveries,:size).by(1)
      end
    end
  end

  describe "sent form notification" do
    it "should render without error" do
      expect{Notifications.sent_form_notification(form_owner, form_recipient, form)}.not_to raise_error
    end

    describe "after successfully rendering" do
      before(:each) do
        @mailer = Notifications.sent_form_notification(form_owner, form_recipient, form)
      end

      it "should have the recipient's name" do
        @mailer.body.should have_content "#{form_recipient.name}"
      end

      it "should have the sender's name" do
        @mailer.body.should have_content "#{form_owner.name}"
      end

      it "should have the form's title" do
        @mailer.body.should have_content "#{form.title}"
      end

      it "should deliver successfully" do
        expect{ Notifications.deliver(@mailer) }.not_to raise_error
      end

      it "should be added to the delivery queue" do
        expect{ Notifications.deliver(@mailer) }.to change(ActionMailer::Base.deliveries,:size).by(1)
      end
    end
  end

  describe "complete form notification" do
    it "should render without error" do
      expect{Notifications.complete_form_notification(form_owner, form_recipient, form)}.not_to raise_error
    end

    describe "after successfully rendering" do
      before(:each) do
        @mailer = Notifications.complete_form_notification(form_owner, form_recipient, form)
      end

      it "should have the recipient's name" do
        @mailer.body.should have_content "#{form_recipient.name}"
      end

      it "should have the sender's name" do
        @mailer.body.should have_content "#{form_owner.name}"
      end

      it "should have the form's title" do
        @mailer.body.should have_content "#{form.title}"
      end

      it "should deliver successfully" do
        expect{ Notifications.deliver(@mailer) }.not_to raise_error
      end

      it "should be added to the delivery queue" do
        expect{ Notifications.deliver(@mailer) }.to change(ActionMailer::Base.deliveries,:size).by(1)
      end
    end
  end
end
