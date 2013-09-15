FactoryGirl.define do
  factory :wen_user do
    name "Hahasun"
    email "hahasun@example.com"
    tel 12345
    addr "hahasun street"
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end
