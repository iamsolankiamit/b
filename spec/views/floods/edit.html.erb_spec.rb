require 'spec_helper'

describe "floods/edit" do
  before(:each) do
    @flood = assign(:flood, stub_model(Flood,
      :firstname => "MyString",
      :lastname => "MyString",
      :address => "MyString",
      :city => "MyString",
      :accommodates => 1,
      :phone => ""
    ))
  end

  it "renders the edit flood form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flood_path(@flood), "post" do
      assert_select "input#flood_firstname[name=?]", "flood[firstname]"
      assert_select "input#flood_lastname[name=?]", "flood[lastname]"
      assert_select "input#flood_address[name=?]", "flood[address]"
      assert_select "input#flood_city[name=?]", "flood[city]"
      assert_select "input#flood_accommodates[name=?]", "flood[accommodates]"
      assert_select "input#flood_phone[name=?]", "flood[phone]"
    end
  end
end
