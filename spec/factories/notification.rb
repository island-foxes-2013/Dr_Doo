FactoryGirl.define do
  factory :notification do
    form_id { 1 }
    recipient_email { "fox@corneria.gov" }
    sender_id { 1 }
    completed { false }
  end
end
