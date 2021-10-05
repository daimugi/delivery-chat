require 'rails_helper'

RSpec.describe Post, type: :model do 
  
  # 文字数テスト
  
  it "内容が101文字以上の場合、無効である" do
    post = FactoryBot.build(:post, content: '12345' * 20 + 'a')
    post.valid?
    expect(post.errors[:content]).to include("は100文字以内で入力してください")
  end
  
  
  # presence trueのテスト
  
  it "内容がない場合、無効である" do 
    post = FactoryBot.build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).to include("を入力してください")
  end
  
  it "料金がない場合、無効である" do 
    post = FactoryBot.build(:post, price: nil)
    post.valid?
    expect(post.errors[:price]).to include("を入力してください")
  end
  
  # アソシエーションテスト
  it "多対1となっている場合、有効である" do 
    expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
  end
end  