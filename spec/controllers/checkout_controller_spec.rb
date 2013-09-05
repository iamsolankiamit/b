require 'spec_helper'

describe CheckoutController do

  describe "GET 'booking'" do
    it "returns http success" do
      get 'booking'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

end
