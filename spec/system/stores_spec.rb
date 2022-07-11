require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '店舗新規登録', type: :system do
  before do
    @store = FactoryBot.build(:store)
  end

  context '店舗新規登録ができるとき' do
    it '正しい情報を入力すれば店舗新規登録ができてトップページへ移動する' do
      # ログインページへ移動する
      basic_pass root_path
      visit root_path
      # ログインページに新規登録ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Sign up')
      # 新規登録ページへ移動する
      visit new_store_registration_path
      # 店舗情報を入力する
      fill_in 'Name', with: @store.name
      fill_in 'Email', with: @store.email
      fill_in 'Password', with: @store.password
      fill_in 'Password confirmation', with: @store.password_confirmation
      # Create Accountボタンを押すとStoreモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Store.count }.by(1)
      # トップページへ移動したことを確認する
      expect(current_path).to eq(root_path)
    end
  end
  context '店舗新規登録ができないとき' do
    it '誤った情報では店舗新規登録ができずに新規登録ページへ戻ってくる' do
      # ログインページへ移動する
      basic_pass root_path
      visit root_path
      # ログインページに新規登録ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Sign up')
      # 新規登録ページへ移動する
      visit new_store_registration_path
      # 店舗情報を入力する
      fill_in 'Name', with: ''
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: ''
      # Create Accountボタンを押してもStoreモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Store.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq(store_registration_path)
    end
  end
end

RSpec.describe '店舗ログイン', type: :system do
  before do
    @store = FactoryBot.create(:store)
  end

  context 'ログインしていないとき' do
    it 'ログインしていない状態でトップページにアクセスした場合、ログインページへ移動する' do
      # トップページへ移動する
      # ログインしていない場合、ログインページへ移動していることを確認する
    end
  end
  context 'ログインができるとき' do
    it '保存されている店舗情報と合致すればログインができる' do
      # トップページへ移動する
      # ログインしていない場合、ログインページへ移動していることを確認する
      # 店舗情報を入力する
      # Log inボタンを押す
      # トップページへ移動したことを確認する
    end
  end
  context 'ログインができないとき' do
    it '保存されている店舗情報と合致しないとログインができない' do
      # トップページへ移動する
      # ログインしていない場合、ログインページへ移動していることを確認する
      # 店舗情報を入力する
      # Log inボタンを押す
      # ログインページへ戻されることを確認する
    end
  end
end
