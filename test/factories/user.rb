FactoryGirl.define do
  factory :user do
    email { 'john_doe@gmail.com' }
    password '123456'
  end
end
