require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  
  before do
    @user = create(:user)
  end
  
  it "ログイン画面の表示に成功すること" do
    get login_path
    expect(response).to have_http_status(200)
  end  
  
  describe "userの動作確認"
  # let (:user_name) { "taro" }
  it "ログインに成功すること" do
    login @user
    subject
    expect(response).to have_http_status(:ok)
  end  
end