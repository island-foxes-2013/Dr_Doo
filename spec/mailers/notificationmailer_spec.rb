require "spec_helper"

describe 'NotificationMailer' do

  let!(:sender) { FactoryGirl.create(:user, id: 1, name: "Star Wolf", email: "wolf@starwolf.gov", password: "password", password_confirmation: "password") }
  let!(:user) { FactoryGirl.create(:user, id: 2, name: "Fox McCloud", email: "fox@corneria.gov", password: "password", password_confirmation: "password") }
  let!(:form) { FactoryGirl.create(:form, id: 1, user_id: 1, title: "Corneria Non-Disclosure Agreement") }
  let!(:email) { "fox@corneria.gov" }
  let!(:notification) { FactoryGirl.create(:notification, form_id: 1, sender_id: 1, recipient_email: email, completed: false) }
  let!(:notification_non_user) { FactoryGirl.create(:notification, form_id: 1, sender_id: 1, recipient_email: "falco@corneria.gov", completed: false) }

  describe "form new email" do
    it "should render without error" do
      expect{NotificationMailer.form_new_email(notification)}.not_to raise_error
    end

    describe "after successfully rendering" do
      before(:each) do
        @mailer = NotificationMailer.form_new_email(notification)
        @mailer_to_non_user = NotificationMailer.form_new_email(notification_non_user)
      end

      it "should have the sender's name" do
        @mailer.body.should have_content "Star Wolf"
      end

      it "should not have the recipient's name if they do not already have an account" do
        @mailer_to_non_user.body.should_not have_content "Fox McCloud"
      end

      it "should have the recipient's name if they already have an account" do
        @mailer.body.should have_content "Fox McCloud"
      end

      it "should have the form's title" do
        @mailer.body.should have_content "Corneria Non-Disclosure Agreement"
      end

      it "should deliver successfully" do
        expect{ NotificationMailer.form_new_email(notification).deliver }.not_to raise_error
      end

      it "should be added to the delivery queue" do
        expect{ NotificationMailer.form_new_email(notification).deliver }.to change(ActionMailer::Base.deliveries,:size).by(1)
      end
    end
  end

  describe "sent form notification" do
    it "should render without error" do
      expect{NotificationMailer.form_sent_email(notification)}.not_to raise_error
    end

    describe "after successfully rendering" do
      before(:each) do
        @mailer = NotificationMailer.form_sent_email(notification)
        @mailer_to_non_user = NotificationMailer.form_sent_email(notification_non_user)
      end

      it "should have the recipient's email" do
        @mailer.body.should have_content "fox@corneria.gov"
      end

      it "should have the recipient's name and email if they already have an account" do
        @mailer.body.should have_content "Fox McCloud"
        @mailer.body.should have_content "fox@corneria.gov"
      end

      it "should have the recipient's email if they do not already have an account" do
        @mailer_to_non_user.body.should have_content "falco@corneria.gov"
        @mailer_to_non_user.body.should_not have_content "fox@corneria.gov"
      end

      it "should have the sender's name" do
        @mailer.body.should have_content "Star Wolf"
      end

      it "should have the form's title" do
        @mailer.body.should have_content "Corneria Non-Disclosure Agreement"
      end

      it "should deliver successfully" do
        expect{ NotificationMailer.form_sent_email(notification).deliver }.not_to raise_error
      end

      it "should be added to the delivery queue" do
        expect{ NotificationMailer.form_sent_email(notification).deliver }.to change(ActionMailer::Base.deliveries,:size).by(1)
      end
    end
  end

  describe "complete form notification" do

    let(:existing_user) { FactoryGirl.build(:user, name: "Fox McCloud", email: "fox@corneria.gov", password: "password", password_confirmation: "password") }
    let(:existing_user_email) { "test@test.com" }

    it "should render without error" do
      expect{NotificationMailer.form_completed_email(notification)}.not_to raise_error
    end

    describe "after successfully rendering" do
      before(:each) do
        @mailer = NotificationMailer.form_completed_email(notification)
      end

      it "should have the recipient's name" do
        @mailer.body.should have_content "Fox McCloud"
      end

      it "should have the sender's name" do
        @mailer.body.should have_content "Star Wolf"
      end

      it "should have the form's title" do
        @mailer.body.should have_content "Corneria Non-Disclosure Agreement"
      end

      it "should deliver successfully" do
        expect{ NotificationMailer.form_completed_email(notification).deliver }.not_to raise_error
      end

      it "should be added to the delivery queue" do
        expect{ NotificationMailer.form_completed_email(notification).deliver }.to change(ActionMailer::Base.deliveries,:size).by(1)
      end
    end
  end
end
