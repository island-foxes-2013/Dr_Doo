FactoryGirl.define do
  factory :user do
    name { "Fox McCloud" }
    email { "fox@corneria.gov" }
    password { "password1" }
    password_confirmation { "password1" }
  end

end

