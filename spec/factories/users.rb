FactoryGirl.define do
  factory :user do
    firstname "john"
    lastname "doe"
    email "someone@example.com"
    password "12345678"
    password_confirmation "12345678"
  end
end
