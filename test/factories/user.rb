FactoryGirl.define do
  factory :user do
    email { Faker::Internet.safe_email('john') }
    password Faker::Internet.password
  end
end
