require 'rails_helper'

RSpec.describe 'メッセージ投稿', type: :system do
  before do
    @consultation = FactoryBot.create(:consultation)
  end

  context 'メッセージ投稿ができるとき' do
    it '正しい情報を入力すればメッセージ投稿ができて、投稿内容が表示されている' do
      # ログインする
      log_in(@consultation.store)
      # 作成されたチャットルームへ移動する
      click_on(@consultation.room.name)
      # メッセージ情報を入力する
      select(value = '【依頼】譲って！！', from: 'message[business]')
      fill_in 'message[ingredients]', with: '食材'
      fill_in 'message[quantity]', with: '1個'
      fill_in 'message[comment]', with: 'コメント'

      # 【要修正】
      # 送信ボタンを押すとMessageモデルのカウントが1上がることを確認する
      # expect {
      # find('input[name="commit"]').click
      # }.to change { Message.count }.by(1)

      # 【仮】
      # 送信ボタンを押す
      find('input[name="commit"]').click

      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content('コメント')
    end
  end
  context 'メッセージ投稿ができないとき' do
    it '誤った情報ではメッセージ投稿ができない' do
      # ログインする
      log_in(@consultation.store)
      # 作成されたチャットルームへ移動する
      click_on(@consultation.room.name)
      # メッセージ情報を入力する
      fill_in 'message[ingredients]', with: '食材'
      fill_in 'message[quantity]', with: '1個'
      fill_in 'message[comment]', with: 'コメント'
      # 送信ボタンを押してもMessageモデルのカウントは上がらないことを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Message.count }.by(0)
      # 送信した値がブラウザに表示されていないことを確認する
      expect(page).to have_no_content('コメント')
    end
  end
end
