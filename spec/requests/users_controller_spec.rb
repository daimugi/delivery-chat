require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  before do
    @user = FactoryBot.create(:user) #FactoryBotを利用してuserデータを作成
  end
  
  describe "GET #index" do
    it "正しいビューに遷移する" do
      get users_path
      expect(response.status).to eq 200
    end  
  end  
  
  describe "GET #show" do
    
    let(:user) {post :login, params: { user: user } } 
    #無効なユーザー
    let(:user) { create(:user) }
    
    #before doで囲んだ処理は、itの直前に毎回実行される
    before do
      # user.login!
      # user.user_params
    end  
    #正常系の処理
    it 'ログインができること' do 
      subject 
      expect(response.status).to eq 200
    end  
  end  
end