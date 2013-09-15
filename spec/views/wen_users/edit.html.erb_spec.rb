require 'spec_helper'

describe "wen_users/edit" do
  before(:each) do
    @wen_user = assign(:wen_user, stub_model(WenUser,
      :name => "MyString",
      :email => "MyString",
      :tel => 1,
      :addr => "MyString"
    ))
  end

  it "renders the edit wen_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wen_user_path(@wen_user), "post" do
      assert_select "input#wen_user_name[name=?]", "wen_user[name]"
      assert_select "input#wen_user_email[name=?]", "wen_user[email]"
      assert_select "input#wen_user_tel[name=?]", "wen_user[tel]"
      assert_select "input#wen_user_addr[name=?]", "wen_user[addr]"
    end
  end
end
