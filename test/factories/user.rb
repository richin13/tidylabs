FactoryGirl.define do
  factory :user do
    name 'john'
    lastname 'doe'
    email { 'john_doe@gmail.com' }
    password '123456'
    pin 12345
    authentication_token '1G8_s7P-V-4MGojaKD7a'
  end

  factory :collaborator, class: User do
    name 'john'
    lastname 'doe'
    email { 'john_doe@gmail.com' }
    password '123456'
    pin 12345
    authentication_token '1G8_s7P-V-4MGojaKD7a'
    can_login false
  end

  factory :admin, class: User do
    name 'Ricardo'
    lastname 'Madriz'
    email { 'not-my-email@gmail.com' }
    password '654321'
    pin 8080
    authentication_token 'pA4Z3374$_fq4tNaZjojajeju'
    can_login true
  end
end
