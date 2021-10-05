require 'rails_helper'

RSpec.describe Room, type: :model do 
  
  # アソシエーションテスト
  
  it "1対多となっていた場合、有効である" do
    expect(Room.reflect_on_association(:messages).macro).to eq :has_many
    expect(Room.reflect_on_association(:entries).macro).to eq :has_many
  end
end  