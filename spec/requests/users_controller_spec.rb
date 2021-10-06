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
    before do
      require_user_logged_in @user
    end
    
    it "正しいビューに遷移する" do
      get user_path(user)
      expect(response.status).to eq 200
    end  
  end  
end