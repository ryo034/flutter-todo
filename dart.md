書き方
コーディングルールは`codingRule.md`に書いてある

## 変数
```dart
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};
```

型を指定する場合は`String`などをつける
`dynamic`は`var`と同じ

```dart
String name = 'Voyager I';
int year = 1977;
double antennaDiameter = 3.7;
List<String> flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
Map<String, dynamic> image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};
```

初期値を指定しない場合は`null`
```dart
int lineCount; // null
```

## 定数
```dart
final name = 'Bob';
final String nickname = 'Bobby';
```

- [Final and const](https://dart.dev/guides/language/language-tour#final-and-const)

## コレクション
```dart
final aListOfStrings = ['one', 'two', 'three'];
final aSetOfStrings = {'one', 'two', 'three'};
final aMapOfStringsToInts = {
  'one': 1,
  'two': 2,
  'three': 3,
};

final aListOfInts = <int>[];
final aSetOfInts = <int>{};
final aMapOfIntToDouble = <int, double>{};
```

## 制御構文
```dart
if (year >= 2001) {
  print('21st century');
} else if (year >= 1901) {
  print('20th century');
}

for (var object in flybyObjects) {
  print(object);
}

for (int month = 1; month <= 12; month++) {
  print(month);
}

while (year < 2016) {
  year += 1;
}
```

### if
`JavaScript`と違うのは、条件式は`bool`の値しか取らない事
Dartにおいてtrueは`bool true`のみ

```dart
// Error
var flg = 1;
if (flg) print('Hello');
```

これは大丈夫

```dart
var name = '';
if (name.isEmpty) print('Hello');
```


ワンライナーが使える
```dart
var flg = true;
if (flg) print('Hello');
```

## 関数

戻り値の型を指定するのが推奨
基本的には全て戻り値は書くこと

```dart
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);
```

アロー => を使ったショートハンドも書ける
無名関数扱うのに便利
あと forEach(print) みたいに引数として渡せる

```dart
flybyObjects.where((name) => name.contains('turn')).forEach(print);
```

```dart
```

```dart
```


## インポート

ライブラリや外部ファイルのインポート
```dart
// Importing core libraries
import 'dart:math';

// Importing libraries from external packages
import 'package:test/test.dart';

// Importing files
import 'path/to/my_other_file.dart';
```

ライブラリのインストールは後述

## クラス
### 抽象クラス

```dart
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
```

## 演算子
### ?.
`launchDate` が `null` だったら `null` を返す
`null `でなければ後続のメソッドを呼ぶ

```dart
launchDate?.year

以下と同義

(launchDate != null) ? launchDate.year : null;
```

### ??=
- 左辺の値が `null`だったら右辺の値を代入する
- `null`でなければ何もしないみたいなやつ

```dart
int a; // The initial value of a is null.
a ??= 3;
print(a); // <-- Prints 3.

a ??= 5;
print(a); // <-- Still prints 3.
```

### ??
- 先の例で評価をそのまま返すパターン

```dart
print(1 ?? 3); // <-- Prints 1.
print(null ?? 12); // <-- Prints 12.
```

## 変数展開
- `$変数名`で展開される
- `Dart`では`シングルクォート`が推奨されているが、シングルでもダブルでも展開される

```dart
print('Launched: $launchYear ($years years ago)');
```

式を書きたい場合、 `${}`とする

```dart
print('2 + 3 = ${2 + 3}');
```

## 継承
- `extends`キーワードで単一継承

```dart
class Orbiter extends Spacecraft {
  num altitude;
  Orbiter(String name, DateTime launchDate, this.altitude) : super(name, launchDate);
}
```

## ミックスイン
- `with`でクラスにメソッドを生成
- スコープとかが面倒そうなので、あまり使わない方が良い

```dart
class Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  // ···
}

var piloted = PilotedCraft('Piloted Craft I', DateTime(2001, 10,3));
piloted.describeCrew();
```

```dart
```
```dart
```

## インターフェース
- `Dart`には`interface`というキーワードはない
- あらゆるクラスは暗黙的にインターフェースを定義している
- インターフェースを使用する場合、クラスが持つメンバーとメソッド全部実装する必要がある
- [implicit-interfaces](https://dart.dev/guides/language/language-tour#implicit-interfaces)

> Dart has no interface keyword. Instead, all classes implicitly define an interface. Therefore, you can implement any class.

```dart
class MockSpaceship implements Spacecraft {
  // ···
}
```

## 非同期
- `async/await`を使用

```dart
const oneSecond = Duration(seconds: 1);
// ···
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}
```

- `Future/then` で書くことも可能

```dart
Future<void> printWithDelay(String message) {
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}
```

- ストリームの場合

```dart
Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (var object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object';
  }
}
```
## 制御構文
## 制御構文
## 制御構文
## 制御構文
## 制御構文



# 参考記事
- [よくわかるDart 🎯](https://qiita.com/sakuraya/items/e239206c142c026d7133)
