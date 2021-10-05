require 'rails_helper'

RSpec.describe User, type: :model do 
  
  # 入力されている場合のテスト
  
  it "名前、メール、住所、パスワードがある場合、有効である" do 
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end  
  
  
  # presence trueのテスト
  
  it "名がない場合、無効である" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end  
  
  it "メールアドレスがない場合、無効である" do 
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end
  
  it "住所がない場合、無効である" do 
    user = FactoryBot.build(:user, address: nil)
    user.valid?
    expect(user.errors[:address]).to include("を入力してください")
  end  
  
  it "パスワードがない場合、無効である" do 
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end  
  
  
  # emailの一意制約テスト
  
  it "メールアドレスが重複している場合、無効である" do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("はすでに存在します")
  end  
  
  
  # 文字数テスト
  
  it "名前が16文字以上である場合、無効である" do
    user = FactoryBot.build(:user, name: '12345678901234567')
    user.valid?
    expect(user.errors[:name]).to include("は16文字以内で入力してください")
  end  
  
  it "コメントが75文字以上である場合、無効である" do
    user = FactoryBot.build(:user, introduction: '12345' * 15 + 'a') 
    user.valid?
    expect(user.errors[:introduction]).to include("は75文字以内で入力してください")
  end  
  
  it "住所が50文字以上である場合、無効である" do
    user = FactoryBot.build(:user, address: '12345' * 10 + 'a')
    user.valid?
    expect(user.errors[:address]).to include("は50文字以内で入力してください")
  end  
  
  it "メールアドレスが50文字以内である場合、無効である" do
    user = FactoryBot.build(:user, email: '12345' * 10 + 'a')
    user.valid?
    expect(user.errors[:email]).to include("は50文字以内で入力してください")
  end  
    
  
end
