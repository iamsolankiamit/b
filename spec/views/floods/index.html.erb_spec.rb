require 'spec_helper'

describe "floods/index" do
  before(:each) do
    assign(:floods, [
      stub_model(Flood,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address => "Address",
        :city => "City",
        :accommodates => 1,
        :phone => ""
      ),
      stub_model(Flood,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address => "Address",
        :city => "City",
        :accommodates => 1,
        :phone => ""
      )
    ])
  end

  it "renders a list of floods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
