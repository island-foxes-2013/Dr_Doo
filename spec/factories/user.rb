FactoryGirl.define do
  factory :user do
    email { "1234stander@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end

