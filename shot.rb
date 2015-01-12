require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
FileUtils.mkdir_p 'snapshots'

[
  { email: 'yui_hirasawa@test.co.jp', password: 'yuihirasawa' },
].each do |user|
  # ログイン
  driver.navigate.to 'http://localhost:3000'
  driver.find_element(:id, 'user_email').send_keys(user[:email])
  driver.find_element(:id, 'user_password').send_keys(user[:password])
  driver.find_element(:name, 'commit').submit
  sleep(1) # デモのため少し待機

  # profileページに遷移
  driver.navigate.to 'http://localhost:3000/profile'
  sleep(1) # デモのため少し待機

  # snapshotを撮る
  username = driver.find_element(:id, 'username').text
  driver.save_screenshot("snapshots/#{username}.png")

  # 終了
  driver.quit
end
