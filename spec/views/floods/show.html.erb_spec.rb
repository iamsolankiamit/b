require 'spec_helper'

describe "floods/show" do
  before(:each) do
    @flood = assign(:flood, stub_model(Flood,
      :firstname => "Firstname",
      :lastname => "Lastname",
      :address => "Address",
      :city => "City",
      :accommodates => 1,
      :phone => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Firstname/)
    rendered.should match(/Lastname/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
