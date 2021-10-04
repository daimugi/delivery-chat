FactoryBot.define do 
  factory :user do 
    name { 'taro' }
    email { Faker::Internet.email }
    address { '東京タワー' }
    password { 'password' }
    password_confirmation { 'password' }
  end 
end  