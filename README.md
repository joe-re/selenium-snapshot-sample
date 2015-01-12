# Selenium Snapshot Sample

SeleniumWebDriverの社内向けのプレゼンテーション資料 + デモアプリケーションです。

簡単なプロフィールを登録するWebアプリケーションと、Selenium Web Driverを使ってsnapshotを撮るスクリプトを含んでいます。

## Requirments
- [imagemagick](http://www.imagemagick.org/index.php)
- selenium-webdriver(ruby gems)

## Setup
```
bundle install
rake db:migrate
```

## Usage

### start up demo application
```
rails server
```

### take a snapshot
shot.rbに含まれるユーザ名、パスワードを修正、追加して実行します。

```
ruby shot.rb
```

## Presentation
- docs/selenium_lt.key
