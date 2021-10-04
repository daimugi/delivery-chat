require 'rails_helper'

# RSpec.describe 'Userモデルのテスト', type: :model do 
  describe User do 
    describe '#create' do
      it 'is valid' do
        user = build(:user)
        user.valid?
        expect(:user).to be_valid
      end 
    end  
  end 
# end  