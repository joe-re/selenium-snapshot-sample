require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
FileUtils.mkdir_p 'screenshots'

[
  { email: 'yui_hirasawa@test.co.jp', password: 'yuihirasawa' },
  { email: 'mio_akiyama@test.co.jp', password: 'mioakiyama' },
  { email: 'ritsu_tainaka@test.co.jp', password: 'ritsutainaka' },
  { email: 'tsumugi_kotobuki@test.co.jp', password: 'tsumugikotobuki' },
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

  # screenshotを撮る
  username = driver.find_element(:id, 'username').text
  driver.save_screenshot("screenshots/#{username}.png")

  # ログアウト
  driver.find_element(:id, 'logout').click
end

# 終了
driver.quit
