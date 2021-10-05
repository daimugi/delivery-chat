require 'rails_helper'

RSpec.describe Entry, type: :model do 
  
  # アソシエーションテスト
  
  it "多対1となっていた場合、有効である" do
    expect(Entry.reflect_on_association(:user).macro).to eq :belongs_to
    expect(Entry.reflect_on_association(:room).macro).to eq :belongs_to
  end
end  