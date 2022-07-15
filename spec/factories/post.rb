FactoryBot.define do
  factory :post do
    association :user

    description { FFaker::Name.female_name_with_suffix }
  end
end
