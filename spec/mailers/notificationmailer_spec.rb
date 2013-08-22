require "spec_helper"

describe 'NotificationMailer' do

  let!(:user) { FactoryGirl.create(:user, id: 1, name: "Star Wolf", email: "wolf@starwolf.gov", password: "password", password_confirmation: "password") }
  let!(:user) { FactoryGirl.create(:user, id: 2, name: "Star Fox", email: "fox@cornera.gov", password: "password", password_confirmation: "password") }
  let!(:form) { FactoryGirl.create(:form, id: 1, user_id: 1, title: "Corneria Non-Disclosure Agreement") }
  let!(:email) { "fox@corneria.gov" }
  let!(:notification) { FactoryGirl.create(:notification, form_id: 1, sender_id: 1, recipient_email: email, completed: false) }

  describe "form new email" do
    it "should render without error" do
      expect{NotificationMailer.form_new_email(notification)}.not_to raise_error
    end

    describe "after successfully rendering" do
      before(:each) do
        @mailer = NotificationMailer.form_new_email(notification)
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
      expect{NotificationMailer.form_complete_email(notification)}.not_to raise_error
    end

    describe "after successfully rendering" do
      before(:each) do
        @mailer = NotificationMailer.form_complete_email(notification)
      end

      it "should have the recipient's name if they have an account" do
        @test_mailer = NotificationMailer.form_complete_email(form_owner, existing_user_email, form)
        @mailer.body.should have_content "#{form_recipient.name}"
      end

      it "should have the sender's name" do
        @mailer.body.should have_content "#{form_owner.name}"
      end

      it "should have the form's title" do
        @mailer.body.should have_content "#{form.title}"
      end

      it "should deliver successfully" do
        expect{ NotificationMailer.form_complete_email(notification).deliver }.not_to raise_error
      end

      it "should be added to the delivery queue" do
        expect{ NotificationMailer.form_complete_email(notification).deliver }.to change(ActionMailer::Base.deliveries,:size).by(1)
      end
    end
  end
end
