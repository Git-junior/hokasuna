require 'rails_helper'

RSpec.describe "チャットルーム新規作成", type: :system do
  before do
    @store1 = FactoryBot.create(:store)
    @store2 = FactoryBot.create(:store)
  end

  context '新規作成できるとき' do
    it '正しい情報を入力すればチャットルーム新規作成ができてトップページへ移動する' do
      # ログインする
      # チャットルーム作成へのボタンがあることを確認する
      # チャットルーム新規作成へ移動する
      # ルーム情報を入力する
      # Create Roomボタンを押すとRoomモデルのカウントが1上がることを確認する
      # トップページへ移動したことを確認する
    end
  end
  context '新規作成できないとき' do
    it '誤った情報ではチャットルーム新規作成ができずに新規作成ページへ戻ってくる' do
      # ログインする
      # チャットルーム作成へのボタンがあることを確認する
      # チャットルーム新規作成へ移動する
      # ルーム情報を入力する
      # Create Roomボタンを押してもRoomモデルのカウントは上がらないことを確認する
      # 新規作成ページへ戻されることを確認する
    end
  end
end
