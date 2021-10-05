require 'rails_helper'

RSpec.describe Message, type: :model do 
  
  # 入力されている場合のテスト
    # it "内容がある場合、有効である" do
    #   message = FactoryBot.build(:message)
    #   expect(message).to be_valid
    # end  
    
  #   it "内容と画像がない場合、無効である" do 
  #     message = FactoryBot.build(:message, content_or_image: nil)
  #     message.valid?
  #     expect(message.errors[:content_or_image]).to
  #   end

  # アソシエーションテスト
  it "多対1となっていた場合、有効である" do
    expect(Message.reflect_on_association(:user).macro).to eq :belongs_to
    expect(Message.reflect_on_association(:room).macro).to eq :belongs_to
  end

end  
  