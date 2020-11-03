# コーディングルール

## settings.json
```json
  "editor.tabSize": 4,
  "editor.insertSpaces": true,
  "editor.detectIndentation": false
```

## インデント
- 半角スペース

```dart
if (hoge) {
  someFunc();
}
someFunc(
  color: Colors.blue,
  fontSize: 16.0,
);
```

継続インデントは半角スペース4つ
```dart
someFunc(
    context, value);
```

### 開きカーリーブレイス（{）を同じ行に置く

```dart
class Foo {
  method() {
    if (true) {
      // ...
    } else {
      // ...
    }
  }
}
```

### すべてのフローコントロールにカーリーブレイスを記述する
```dart
if (true) {
  print('sanity');
} else {
  print('opposite day!');
}

if (true) print('sanity');
else print('opposite day!');
```

例外として、else節の無い一行のif文ならば省略しても構わない
```dart
if (arg == null) return defaultValue;
```

### switch文のcaseは2つ、caseのボディは4つのスペースでインデントする
```dart
switch (fruit) {
  case 'apple':
    print('delish');
    break;

  case 'durian':
    print('stinky');
    break;
}
```

### メソッド名、演算子、setterやパラメータリストの宣言の間にスペースを入れない
❌ NG
```dart
bool convertToBool (arg) { ... }
bool operator == (other) { ... }
set contents (value) { ... }
```

👍 OK
```dart
bool convertToBool(arg) { ... }
bool operator ==(other) { ... }
set contents(value) { ... }
```

```dart
```

```dart
```

```dart
```

```dart
```


