require 'spec_helper'

describe "wen_users/index" do
  before(:each) do
    assign(:wen_users, [
      stub_model(WenUser,
        :name => "Name",
        :email => "Email",
        :tel => 1,
        :addr => "Addr"
      ),
      stub_model(WenUser,
        :name => "Name",
        :email => "Email",
        :tel => 1,
        :addr => "Addr"
      )
    ])
  end

  it "renders a list of wen_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Addr".to_s, :count => 2
  end
end
