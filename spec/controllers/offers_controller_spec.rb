require 'spec_helper'
describe OffersController do
  let(:valid_attributes) { { "" => ""  } }

  describe "GET index" do
    it "assigns all offers of the current user as @offers" do
      offer = Offer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:offers).should eq([offer])
    end
  end

  describe "GET show" do
    it "assigns the requested offer as @offer" do
      offer = offer.create! valid_attributes
      get :show, {:id => offer.to_param}, valid_session
      assigns(:offer).should eq(offer)
    end
  end
  
  describe "GET new" do
    it "assigns a new offer as @offer" do
      get :new, {}, valid_session
      assigns(:offer).should be_a_new(Offer)
    end
  end
end
