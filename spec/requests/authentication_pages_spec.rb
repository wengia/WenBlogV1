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

  describe "authorization" do
    describe "for non-signed-in users" do
      let(:wen_user) { FactoryGirl.create(:wen_user) }

      describe "in the Users controller" do
        describe "visiting the edit page" do
          before { visit edit_wen_user_path(wen_user) }
          it { should have_title('Sign In') }
        end
        describe "submitting to the update action" do
          before { patch wen_user_path(wen_user) }
          specify { expect(response).to redirect_to(signin_path) }
        end
        describe "visiting the user index" do
          before { visit wen_users_path }
          it { should have_title('All users') }
        end
      end
    end

    describe "as wrong user" do
      let(:wen_user) { FactoryGirl.create(:wen_user) }
      let(:wrong_user) { FactoryGirl.create(:wen_user, name: "wrong") }
      # before { sign_in wen_user, no_capybara: true }
      before do
        remember_token = WenUser.new_remember_token
        cookies[:remember_token] = remember_token
        wen_user.update_attribute(:remember_token, WenUser.encrypt(remember_token))
      end
      

      describe "submitting a GET request to the Users#edit action" do
        before { get edit_wen_user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_url) }
      end

      describe "submitting a PATCH request to the Users#update action" do
        before { patch wen_user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end
  end
end
