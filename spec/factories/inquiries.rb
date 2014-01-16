# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inquiry do
    offer_id "MyString"
    sender_id 1
    receiver_id 1
    conversation_id 1
    check_in "2014-01-11"
    check_out "2014-01-11"
    guest_count 1
  end
end
