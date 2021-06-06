FirebaseとUIKitで作るATM検索アプリ
====
　
## 開発環境
- Xcode version 11.3.1
- pod version 1.9.1
- MacOS Catalina version 10.15.4

## 概要
#### 仕様
- Firebase Cloud Firestorのデータ読み込み、書き込みをUIKitで実装するサンプルアプリ
- アプリの内容は地図上にATMの場所を表示する  
- シェアボタンからslack、twitterなどのSNSにアプリのユニバーサルリンクを貼る
#### Xcodeプロジェクト
- 実務を模してビルド環境を本番とステージングに分離し、アプリ名もそれぞれのビルド環境を変更するように設定
- Info.plistを別ディレクトリにまとめたのでFile Pathを変更（Target > Build Settings > Info.plist File）
- 

## システム構成
- 準備中

## 参考文献
- [Xcodeで本番・ステージング・開発などの環境を分ける方法](https://mo-gu-mo-gu.com/ios-scheme-build-settings/)
　 
## 著者
[@shusuke0812](https://github.com/shusuke0812)
