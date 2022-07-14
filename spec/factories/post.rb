FactoryBot.define do
  factory :post do
    association :user

    description { FFaker::Lorem.sentence }
  end
end
