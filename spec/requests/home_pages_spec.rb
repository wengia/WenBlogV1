require 'spec_helper'

describe "HomePages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title("WenBlog") }
  
    #it "hahah" do
    #  expect(page).to have_title("WenBlog")
    #end
  end
end
