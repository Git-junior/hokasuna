module SignInSupport
  # Basic認証
  def basic_pass(path)
    username = ENV['BASIC_AUTH_USER']
    password = ENV['BASIC_AUTH_PASSWORD']
    visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end

  # ログイン処理
  def log_in(store)
    # トップページへ移動する
    basic_pass root_path
    visit root_path
    # ログインしていない場合、ログインページへ移動していることを確認する
    expect(current_path).to eq(new_store_session_path)
    # 店舗情報を入力する
    fill_in 'Email', with: store.email
    fill_in 'Password', with: store.password
    # Log inボタンを押す
    click_on('Log in')
    # トップページへ移動したことを確認する
    expect(current_path).to eq(root_path)
  end
end
