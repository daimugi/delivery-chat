require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  
  let(:user) { create(:user) }
  
  
  it "ログイン画面の表示に成功すること" do
    get login_path
    expect(response).to have_http_status(200)
  end  
  
  describe "userの動作確認"
  
  it "ログインに成功すること" do
    get user_path(user)
    expect(response).to have_http_status(:ok)
  end  
end