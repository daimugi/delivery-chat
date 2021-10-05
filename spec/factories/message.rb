FactoryBot.define do
  factory :message do
    content { Faker::Lorem.context(number: 100) }
    user 
    # room
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    end
  end  
end