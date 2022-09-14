require 'rails_helper'

RSpec.describe 'チャットルーム新規作成', type: :system do
  before do
    @store1 = FactoryBot.create(:store)
    @store2 = FactoryBot.create(:store)
  end

  context '新規作成できるとき' do
    it '正しい情報を入力すればチャットルーム新規作成ができてトップページへ移動する' do
      # ログインする
      log_in(@store1)
      # チャットルーム作成へのボタンがあることを確認する
      expect(page).to have_content('チャットの作成')
      # チャットルーム新規作成へ移動する
      visit new_room_path
      # ルーム情報を入力する
      fill_in 'チャットルーム名', with: @store1.rooms.name
      select @store2.name, from: 'chat_room_チャットメンバー'
      # Create Roomボタンを押すとRoomモデルのカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Room.count }.by(1)
      # トップページへ移動したことを確認する
      expect(current_path).to eq(root_path)
    end
  end
  context '新規作成できないとき' do
    it '誤った情報ではチャットルーム新規作成ができずに新規作成ページへ戻ってくる' do
      # ログインする
      log_in(@store1)
      # チャットルーム作成へのボタンがあることを確認する
      expect(page).to have_content('チャットの作成')
      # チャットルーム新規作成へ移動する
      visit new_room_path
      # ルーム情報を入力する
      fill_in 'チャットルーム名', with: ''
      select @store2.name, from: 'chat_room_チャットメンバー'
      # Create Roomボタンを押してもRoomモデルのカウントは上がらないことを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Room.count }.by(0)
      # 新規作成ページへ戻されることを確認する
      expect(current_path).to eq(rooms_path)
    end
  end
end

RSpec.describe 'チャットルーム削除', type: :system do
  before do
    @consultation = FactoryBot.create(:consultation)
  end

  it 'チャットルームを削除すると、関連するメッセージが全て削除される' do
    # ログインする
    # 作成されたチャットルームへ移動する
    # メッセージ情報を2つDBに追加する
    # 「チャットを終了」ボタンをクリックすることで、作成した2つのメッセージが削除されていることを確認する
    # トップページに遷移していることを確認する
  end
end
