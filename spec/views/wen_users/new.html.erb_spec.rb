require 'spec_helper'

describe "wen_users/new" do
  before(:each) do
    assign(:wen_user, stub_model(WenUser,
      :name => "MyString",
      :email => "MyString",
      :tel => 1,
      :addr => "MyString"
    ).as_new_record)
  end

  it "renders new wen_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wen_users_path, "post" do
      assert_select "input#wen_user_name[name=?]", "wen_user[name]"
      assert_select "input#wen_user_email[name=?]", "wen_user[email]"
      assert_select "input#wen_user_tel[name=?]", "wen_user[tel]"
      assert_select "input#wen_user_addr[name=?]", "wen_user[addr]"
    end
  end
end
