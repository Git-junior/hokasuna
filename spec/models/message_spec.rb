require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できるとき' do
      it 'businessが存在すれば投稿できる' do
        expect(@message).to be_valid
      end
    end
    context 'メッセージが投稿できないとき' do
      it 'businessが空では投稿できない' do
        @message.business = ''
        @message.valid?
        expect(@message.errors.full_messages).to include("Business can't be blank")
      end
      it 'storeが紐付いていなければ投稿できない' do
        @message.store = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Store must exist')
      end
      it 'roomが紐付いていなければ投稿できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Room must exist')
      end
    end
  end
end
