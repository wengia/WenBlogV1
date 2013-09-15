require 'spec_helper'

describe "WenUsers" do
  subject { page }
  
  describe "signup (new) page" do
    before { visit signup_path }
    let(:submit) { "Submit" }
    
    it { should have_content('sign up') }
    it { should have_title('Sign Up') }

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Tel",          with: 123456
        fill_in "Addr",         with: "example place"
        fill_in "Password",     with: "foobar"
        fill_in "Password confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(WenUser, :count).by(1)
      end
 
      describe "after saving the user" do
        before { click_button submit }
        let(:wen_user) { WenUser.find_by(name: 'Example User') }

        it { should have_link('Sign out') }
        it { should have_title(wen_user.name) }
        it { should have_content('successfully') }
      end
    end
  end

  describe "profile (show) page" do
    let(:wen_user) { FactoryGirl.create(:wen_user) }
    before { visit wen_user_path(wen_user) }

    it { should have_content(wen_user.name) }
    it { should have_title(wen_user.name) }
  end

  
end
