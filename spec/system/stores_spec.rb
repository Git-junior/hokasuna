require 'rails_helper'

RSpec.describe '店舗新規登録', type: :system do
  before do
    @store = FactoryBot.build(:store)
  end

  context '店舗新規登録ができるとき' do
    it '正しい情報を入力すれば店舗新規登録ができてトップページへ移動する' do
      # ログインページへ移動する
      # ログインページに新規登録ページへ遷移するボタンがあることを確認する
      # 新規登録ページへ移動する
      # 店舗情報を入力する
      # Create Accountボタンを押すとStoreモデルのカウントが1上がることを確認する
      # トップページへ移動したことを確認する
    end
  end
  context '店舗新規登録ができないとき' do
    it '誤った情報では店舗新規登録ができずに新規登録ページへ戻ってくる' do
      # ログインページへ移動する
      # ログインページに新規登録ページへ遷移するボタンがあることを確認する
      # 新規登録ページへ移動する
      # 店舗情報を入力する
      # Create Accountボタンを押してもStoreモデルのカウントは上がらないことを確認する
      # 新規登録ページへ戻されることを確認する
    end
  end
end
