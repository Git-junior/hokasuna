require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @store = FactoryBot.build(:store)
  end

  describe '店舗新規登録' do
    context '新規登録できるとき' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@store).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @store.name = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @store.email = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Email can't be blank")
      end
      it '重複するemailが存在する場合は登録できない' do
        @store.save
        another_store = FactoryBot.build(:store, email: @store.email)
        another_store.valid?
        expect(another_store.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @store.email = 'test.com'
        @store.valid?
        expect(@store.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @store.password = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @store.password = Faker::Internet.password(min_length: 1, max_length: 5)
        @store.password_confirmation = @store.password
        @store.valid?
        expect(@store.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @store.password = Faker::Internet.password(min_length: 129)
        @store.password_confirmation = @store.password
        @store.valid?
        expect(@store.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @store.password = '012345'
        @store.password_confirmation = 'abcdef'
        @store.valid?
        expect(@store.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
