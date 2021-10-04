FactoryBot.define do
  factory :post do
    body { Faker::Lorem.content(number:20) }
    user
  end
end