require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }
  
  describe "sign in" do
    before { visit signin_path }
    
    describe "Invalid Sign In" do
      before { click_button "Sign in" }

      it { should have_content('Sign In') }
      it { should have_title('Sign In') }
      it { should have_content('Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_content('Invalid') }
      end
    end

    describe "Valid Sign In" do
      let(:wen_user) { FactoryGirl.create(:wen_user) }
      before do
        fill_in "Name",    with: wen_user.name
        fill_in "Password", with: wen_user.password
        click_button "Sign in"
      end

      it { should have_title(wen_user.name) }
      it { should have_link('Blog', href: wen_user_path(wen_user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "Sign out" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end


end
