# todo
Flutter TODO App.

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

このアプリでできることが以下になります。これらが`UseCase`になります。基本的なCRUD操作ができるようになっています。

- 完了済みTODO一覧を表示
- 未完了TODO一覧を表示
- TODOを登録
- TODOを削除
- TODOを完了済にする
- TODOを未完了に戻す

## Code formatting
- [Code formatting](https://flutter.dev/docs/development/tools/formatting)

## Directory
- [こちら](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course)を参考に作成
- [Flutter TDD Clean Architecture Course [1] – Explanation & Project Structure](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)

clean architecture + ViewModel の構成で実装
```
root/
├ lib/ # ここが作業ディレクトリ
| ├ core/ # 汎用的な処理などを配置
| | ├ error/ # common error handler
| | ├ network/ # network
| | └ util/ # utility
| ├ data/ # すべての入力データ
| | ├ datasources/ # APIのデータとそのデータをキャッシュする
| | | ├ local/ # 内部へのアクセスAPI(local DBなどへのアクセス)
| | | └ remote/ # 外部へのアクセスAPI
| | ├ models/ # モデル
| | └ repositories/ # 新しいデータとキャッシュされたデータのどちらを返すか、いつキャッシュするかなどを決定する場所 implements
| ├ domain/ # 業務に関連するクラスそのものなどを配置.コアビジネスロジックやビジネスオブジェクトをもつ
| | ├ entities/ # エンティティ.ビジネスオブジェクト
| | ├ repositories/ # 特定のモデルのデータ永続化についてを抽象化したオブジェクト
| ├ presentation/ # プレゼンテーション層
| | ├ pages/ # ページ
| | └ widgets/ # ウィジェット一覧
| ├ viewmodel/ # viewmodel
| └ main.dart # メインファイル
├ .idea # IntelliJのプロジェクト固有の設定ファイル
├ .metadata # Flutterプロジェクトのプロパティを追跡する。Flutterツールで機能を評価し、アップグレードなどを実行するために使用される
├ .packages # アプリケーションで使用される依存関係のリスト
├ android/ # ネイティブのプロジェクトフォルダ
├ build/ # ビルドされたファイル郡
├ ios/ # xcode用のiosアプリプロジェクト。iosのネイティブプロジェクトフォルダ
├ pubspec.lock # パッケージ管理ファイルのpubspec.yamlでは管理しきれない依存関係を管理
├ pubspec.yaml # 外部のライブラリ（パッケージ）やアプリのメタデータなどを設定するファイル。package.jsonのような役割
├ test/ # テストファイル郡
└ {app_name}.iml # [Android Studio関連のファイル](https://stackoverrun.com/ja/q/8457827)
```

## Coding rules
- [file naming](https://dart.dev/guides/language/effective-dart/style#do-name-libraries-and-source-files-using-lowercase_with_underscores)
- [日本語訳](https://sbfl.net/blog/2014/12/20/dart-style-guide/)

## Architecture
### Clean Architecture
上記の`Directory`を参照
主に`lib`の中に、`data`,`domain`,`presentation`の形で表現している

![](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?w=556&ssl=1)

### BLoC
- providerを使うこの構成が一番しっくり来たので、ここでは使わない

### ViewModel
### View <—> ViewModel

## 静的解析
`analysis_options.yaml`をプロジェクトのルートに置くと設定に合わせて勝手に解析してくれる！

[Googleで使用されている設定](https://pub.dev/packages/pedantic)

[こちら](https://github.com/flutter/samples/blob/master/animations/analysis_options.yaml)を参考

- [Dart/Flutter の静的解析強化のススメ](https://medium.com/flutter-jp/analysis-b8dbb19d3978)

## test

ソースコードで記載するFlutterのテストには、以下のように3種類のテストがあります。
Unit Testが最も簡素なテストで、Integration Testが最も重たいテストになっています。

||Unit|Widget|Integration|
|-|-|-|-|
|Confidence|Low|Higher|Highest|
|Maintenance cost|Low|Higher|Highest|
|Dependencies|Few|More|Most|
|Execution speed|Quick|Quick|Slow|

### Unit test
- ビジネスロジックに対するテスト
- BLoCパターンや単純な関数など
- `$ flutter test test/unit_test.dart`

### Widget test
- Widget上での挙動を含めたテスト
- Seleniumを使用してヘッドレスブラウザでのテストのイメージ
- `$ flutter test test/widget_test.dart`

### Integration test
- 結合テスト
- `flutter_driver`ライブラリを用いて、エミュレータ上でテストを実行する
- `myapp/test_driver/xxx.dart`と`myapp/test_driver/xxx_test.dart`というように、2ファイル作成する必要がある

Integration Testでは、以下の順番でテストを実行します。
1. 依存ライブラリflutter_driverのインストール
1. FlutterDriverExtension機能の有効化
1. エミュレータを起動してアプリケーションを起動
1. テストコードを記載して実行

`pubspeck.yaml`を以下のように記載
```yaml
dev_dependencies:
  flutter_driver:
    sdk: flutter
```

- [Testing Flutter apps](https://flutter.dev/docs/testing)
- [Flutterの3種類のソースコードテスト(Unit Test, Widget Test, Integration Test)についてのまとめ](https://qiita.com/tez/items/755f340e84e87cfd7609)

### coverage

```bash
$ flutter test --coverage
```

- 可視化したりslack通知するために[Codecov](https://codecov.io/)を使用
- 適当に連携する [Codecovを使ってカバレッジを計測する](https://qiita.com/nasum/items/aff9bf09d49b136bbf94)

`cirlceci/config.yml`を追加

```yml
version: 2.1

orbs:
  codecov: codecov/codecov@1.0.5 # See: https://circleci.com/orbs/registry/orb/codecov/codecov

jobs:
  flutter_analyze_and_test:
    environment:
      - LANG: en_US.UTF-8
    docker:
      - image: circleci/android:api-28
    steps:
      - checkout
      - run:
          name: install flutter sdk
          command: git clone -b stable https://github.com/flutter/flutter.git ~/flutter
      - run:
          name: flutter analyze
          command: ~/flutter/bin/flutter analyze --write=analyzer-output.txt
      - run:
          name: flutter test
          command: ~/flutter/bin/flutter test --coverage --coverage-path=~/coverage/lcov.info
      - codecov/upload:
          file: ~/coverage/lcov.info
```

`codecov.yml`を追加

```yml
# See: https://docs.codecov.io/docs/codecov-yaml
codecov:
  notify:
    require_ci_to_pass: yes

coverage:
  precision: 2
  round: down
  range: "70...100"

  status:
    project:
      default:
        target: 70%
    patch: no # See: https://docs.codecov.io/docs/commit-status#section-patch-status
    changes: no

parsers:
  gcov:
    branch_detection:
      conditional: yes
      loop: yes
      method: no
      macro: no

comment: # See: https://docs.codecov.io/docs/pull-request-comments
  layout: "reach, diff, flags, files"
  behavior: default
  require_changes: no
  require_base: yes
  require_head: yes
```

## エラー対応

### ランチャースクリーン（スプラッシュスクリーン）で止まってしまう
```bash
$ flutter run --debug
```

### リリースモードの場合
```bash
$ flutter run --release
```

## 起動
```bash
# シュミレーターを起動
$ open -a Simulator
# freezedのコマンド
$ flutter pub run build_runner build --delete-conflicting-outputs
$ flutter run
```

# 参考記事
- [【Flutter】パッケージ導入手順](https://qiita.com/akeome/items/0a6ebf3af402fdf62c79)
- [管理しやすい(と思う)Flutterプロジェクトのディレクトリ構造](https://qiita.com/tanakeiQ/items/2c4a7fcb8e95b9aa55ad)
- [Flutterでtodo Listを作ってみた　－初心者必見－](https://qiita.com/Renkon117/items/30175c2a4e6ebd835ca1)
- [Flutter で TODO アプリ📝 を作ってみた！](https://qiita.com/yamatatsu10969/items/3d47cfd66569de98c222)
- [Flutter でも Codecov を導入して test モチベを上げよう!](https://qiita.com/sensuikan1973/items/551572dc8ec92cc90fdb)
- [Flutter入門のためのDart入門](https://qiita.com/teradonburi/items/913fb8c311b9f2bdb1dd)
- [Flutterの状態管理手法の選定](https://medium.com/flutter-jp/state-1daa7fd66b94)
- [iOSをMVC,MVP,MVVM,Clean Architectureで実装してみた](https://medium.com/@rockname/clean-archirecture-7be37f34c943)
- [Flutter を MVVM で実装する](https://wasabeef.medium.com/flutter-%E3%82%92-mvvm-%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%99%E3%82%8B-861c5dbcc565)
- [Flutter MVVM architecture using Dependency Injection (DI) + State Management + Repository Pattern](https://medium.com/@cesarmcferreira/flutter-mvvm-architecture-using-dependency-injection-di-state-management-repository-pattern-92a4ef6ddfc3)


## メモ
- data/models/はレスポンスをrepositoriesで扱うようにしたもの
- UseCaseはViewModelで吸収しているが、分けてもいいかも。flutter-tdd-clean-architecture-courseではblocがViewModelの役割？
