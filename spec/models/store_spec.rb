require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @store = FactoryBot.build(:store)
  end

  describe '店舗新規登録' do
    context '新規登録できるとき' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        
      end
      it 'emailが空では登録できない' do
        
      end
      it '重複するemailが存在する場合は登録できない' do
        
      end
      it 'emailは@を含まないと登録できない' do
        
      end
      it 'passwordが空では登録できない' do
        
      end
      it 'passwordが5文字以下では登録できない' do
        
      end
      it 'passwordが129文字以上では登録できない' do
        
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        
      end
    end
  end
end
