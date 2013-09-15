require 'spec_helper'

describe "WenUsers" do
  subject { page }
  
  describe "signup (new) page" do
    before { visit signup_path }
    it { should have_content('sign up') }
    it { should have_title('Sign Up') }
  end

  describe "profile (show) page" do
    let(:wen_user) { FactoryGirl.create(:wen_user) }
    before { visit wen_user_path(wen_user) }

    it { should have_content(wen_user.name) }
    it { should have_title(wen_user.name) }
  end
end