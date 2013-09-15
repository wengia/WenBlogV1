namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    WenUser.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 tel: 123456
                 addr: "example place"
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      tel = 123456
      addr = "example place"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end