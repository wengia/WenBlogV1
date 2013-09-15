require 'spec_helper'

describe "wen_users/show" do
  before(:each) do
    @wen_user = assign(:wen_user, stub_model(WenUser,
      :name => "Name",
      :email => "Email",
      :tel => 1,
      :addr => "Addr"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
    rendered.should match(/Addr/)
  end
end
