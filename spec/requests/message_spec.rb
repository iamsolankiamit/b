require 'spec_helper'

describe "Message Users" do
  it "creates a new message form current user to host of the offer" do
    user = FactoryGirl.create(:user)
    offer = FactoryGirl.create(:offer)
    visit offer_path(offer)
    click_link "Send message"
    fill_in "message", :with  =>  "I want to book your room for a few days"
    click_button "send"
  end
end
