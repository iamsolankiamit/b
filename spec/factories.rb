FactoryGirl.define do
  sequence :email do  |n| 
    "foo#{n}@example.com"
  end

  factory :offer do
    email
    contact_phone 9999999999
    contact_phone_backup 9999999999
    object_type "apartment"
    size "10000"
    size_type "Square feet"
    bathroom_count 2
    max_guest_count 10
    bed_count 2
    bedroom_count 2
    bed_type "royale"
    allow_marketing true
    street "ganapatrao kadam marg"
    street_no "13"
    address_addon "worli mumbai"
    city "mumbai"
    zip 400018
    country_code_iso "IN"
    currency "INR"
    nightly_rate_amount 1000.0
    weekly_rate_amount 7000.0
    monthly_rate_amount 30000.0
    extra_guest_charge_amount 500.0
    included_guest_count 10
    service_charge_amount 500
    cancelation_policy "strict"
    min_nights 2
    max_nights 20
    checkin_after 12
    checkout_before 12
    is_verified true
    user
  end
  factory :user do
    firstname 'john'
    lastname 'doe'
    phone 9999999999
    email
    password "secret123"
    password_confirmation "secret123"
    confirmed_at Time.now
    factory :user_with_offer do
      after_create do |user|
        create(:offer, user: user)
      end
    end
  end
end
