require 'spec_helper'

describe "WenUsers" do
  subject { page }
  
  describe "index page" do
    let(:wen_user) { FactoryGirl.create(:wen_user) }
    
    before do
      visit signin_path
      fill_in "Name",    with: wen_user.name
      fill_in "Password", with: wen_user.password
      click_button "Sign in"

      FactoryGirl.create(:wen_user, name: "Boba", email: "boba@example.com")
      FactoryGirl.create(:wen_user, name: "Bene", email: "bene@example.com")
      visit wen_users_path
    end

    it { should have_title('All users') }
    it { should have_content('WenUsers') }

    it "should list each user" do
      WenUser.all.each do |user|
        expect(page).to have_selector('li', text: user.name)
      end
    end
  end

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
