require 'spec_helper'

describe WenUser do
  before { @user = WenUser.new(name: "haha", email: "haha@example.com", tel: 123, addr: "haha place", password: "hahaHA", password_confirmation: "hahaHA") }

  subject{ @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:tel) }
  it { should respond_to(:addr) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end
  

  describe "when not present a meaningful name" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when user name is too long" do
    before { @user.name = 'a'*50 }
    it { should_not be_valid }
  end

  describe "when present a tel containing subjects other than number " do
    before { @user.tel = " lalala " }
    it { should_not be_valid }
  end

  describe "when unvalidate email occurs" do
    before { @user.email = " lalala "}
    it { should_not be_valid}
  end

  describe "when the user name have exist" do
    before do
      user_same_name = @user.dup
      user_same_name.name = @user.name
      user_same_name.save
    end
    
    it { should_not be_valid }
  end

  describe "user name should be case-sensitive" do
    before do
      user_same_name = @user.dup
      user_same_name.name = @user.name.upcase
      user_same_name.save
    end
    
    it { should be_valid }
  end

  describe "when password doesn't match" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "return authenticate value" do
    before { @user.save }
    let(:found_user){ WenUser.find_by(name: @user.name) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end
    
    describe "with invalid password" do
      let(:invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq invalid_password }
      specify{ expect(invalid_password).to be_false }
    end
  end

  describe "remember token" do
	before { @user.save }
    its(:remember_token) {should_not be_blank}
  end
end
