require 'spec_helper'

describe Offer do

  it "has a valid factory" do
    FactoryGirl.create(:offer).should be_valid
  end
  it "is invalid without user" do
    FactoryGirl.build(:offer,user: nil).should_not be_valid
  end

  it "is invalid without address_addon" do
    FactoryGirl.build(:offer,address_addon: nil).should be_invalid
  end

  it "is invalid without street" do
    FactoryGirl.build(:offer,street: nil).should be_invalid
  end

  it "is invalid without street_no" do
    FactoryGirl.build(:offer,street_no: nil).should be_invalid
  end

  it "is invalid without nightly_rate_amount" do
    FactoryGirl.build(:offer,nightly_rate_amount: nil).should be_invalid
  end

  it "is invalid without country_code_iso"

  it "should return its current country when given correct Iso Code" do
     offer = FactoryGirl.build(:offer,country_code_iso: "IN")
     offer.country.should == "India"
  end

  it "should return its full street address" do
    offer = FactoryGirl.build(:offer, city: "mumbai", street_no: "12", street: "street", address_addon: "addr adon", country_code_iso: "IN")
    offer.full_street_address.should == "12, street, addr adon, mumbai, India"
  end

  it "should have phone no. if user is having a phone no." do

  end

end
