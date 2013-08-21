FactoryGirl.define do
  factory :user do
    name { "Fox McCloud" }
    email { "fox@corneria.gov" }
    password { "password" }
    password_confirmation { "password" }
  end
end

