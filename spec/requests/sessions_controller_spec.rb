require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  
  it "ログイン画面の表示に成功すること" do
    get login_path
    expect(response).to have_http_status(200)
  end  
  
  # describe "user1の動作確認"
  # let (:user_name) { "taro" }
  # it "ログインに成功すること" do
  #   post login_path, params: { session_form: { user_name: user_name } }
  #   expect(response).to redirect_to user_path
  # end  
end