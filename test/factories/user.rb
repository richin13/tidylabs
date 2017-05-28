FactoryGirl.define do
  factory :user do
    name 'john'
    lastname 'doe'
    email { 'john_doe@gmail.com' }
    password '123456'
    authentication_token '1G8_s7P-V-4MGojaKD7a'
  end
end
