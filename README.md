# アプリケーション名
### Delivery Chat

## アプリケーション概要
近くのユーザーに荷物を配達してもらえるサービスです。

## URL
https://delivery-chat.herokuapp.com/

## ゲストログイン用アカウント
email: a@mail.com  
password: 111

## 使い方
ユーザーの新規登録を行います。

配達する人向け  
1. 配達依頼を選ぶ
2. チャットで配達する商品を確認する
3. 商品を配達する
4. 商品を渡してお金を受け取ったら取引終了  

配達を依頼する人向け  
1. 配達を依頼を投稿する
2. チャットで配達してもらう商品を伝える
3. 配達が完了したらお金を渡して取引終了  

## 使用技術
* Ruby 2.5.3
* Ruby on Rails 5.2.6
* MySQL 5.7
* AWS
* Google Maps API

## 機能一覧
* ユーザー登録、ログイン機能
* 配達依頼投稿機能
  * 位置情報取得機能(Geocoder)
* チャット機能
  * 画像プレビュー機能(CarrierWave)
* ページネーション機能(kaminari)

## テスト
* RSpec
  * 単体テスト(model)