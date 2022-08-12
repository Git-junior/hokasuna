require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できるとき' do
      it 'commentが存在すれば投稿できる' do
        
      end
    end
    context 'メッセージが投稿できないとき' do
      it 'commentが空では投稿できない' do
        
      end
      it 'storeが紐付いていなければ投稿できない' do
        
      end
      it 'roomが紐付いていなければ投稿できない' do
        
      end
    end
  end
end
