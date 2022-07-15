FactoryBot.define do
  factory :user do
    username { FFaker::Name.unique.name }
    email { FFaker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    real_name { FFaker::Name.name }
    website { FFaker::InternetSE.http_url }
    bio { FFaker::Lorem.sentence }
    phone { FFaker::PhoneNumber.area_code }
    gender { FFaker::Gender.random }
  end
end
