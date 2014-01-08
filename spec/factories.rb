FactoryGirl.define do
  sequence :email do  |n| 
    "foo#{n}@example.com"
  end
  factory :user do
    firstname 'john'
    lastname 'doe'
    phone 9999999999
    email
    password "secret123"
    password_confirmation "secret123"
    confirmed_at Time.now
  end
  factory :offer do
    phone 9999999999
    email
    password "secret123"
    password_confirmation "secret123"
    confirmed_at Time.now
  end

end
