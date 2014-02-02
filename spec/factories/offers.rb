FactoryGirl.define do
  factory :offer do
    address_addon "address line 2"
    street "address line 1"
    street_no "some room no."
    city "City"
    email "someone@example.com"
    country_code_iso "IN"
    nightly_rate_amount 1000
    user
  end
end
