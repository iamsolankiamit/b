require 'spec_helper'

describe "MessagingUsers" do
  describe "GET /messaging_users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get messaging_users_path
      response.status.should be(200)
    end
  end
end
