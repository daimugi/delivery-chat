FactoryBot.define do
  factory :post do
    content { Faker::Lorem.context(number:20) }
    user
  end
end