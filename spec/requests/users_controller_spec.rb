require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  # before do
  #   @user = FactoryBot.create(:user)
  #   login
  
  describe "GET #index" do
    it "正しいビューに遷移する" do
      get users_path
      expect(response).to have_http_status(200)
    end  
  end  
  
  describe "GET #show" do
    let (:user)  { create(:user) }
    it "正しいビューに遷移する" do
      get user_path(user)
      expect(response).to have_http_status(200)
    end  
  end  
end