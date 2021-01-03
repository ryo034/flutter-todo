// リスト一覧画面用Widget
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/presentation/pages/CompletedScreen.dart';
import 'package:todo/presentation/pages/TodoAddPage.dart';
import 'package:todo/presentation/pages/TodoScreen.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

// リスト一覧画面用Widget
class _TodoListPageState extends State<TodoListPage> {
  PageController pageController;
  int _screen = 0;

  @override
  void initState() {
    super.initState();
    // コントローラ作成
    // 初期ページの指定。上記で_screenを１とすれば２番目のページが初期表示される。
    pageController = PageController(initialPage: _screen);
  }

  @override
  void dispose() {
    // コントローラ破棄
    pageController.dispose();
    super.dispose();
  }

  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: 'Todo',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.cake),
        label: 'Completed',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: pageController,
          // ページ切り替え時に実行する処理
          // PageViewのonPageChangedはページインデックスを受け取る
          // 以下ではページインデックスをindexとする
          onPageChanged: (index) {
            setState(() {
              // ページインデックスを更新
              _screen = index;
            });
          },
          // ページ下部のナビゲーションメニューに相当する各ページビュー。後述
          children: [
            TodoScreen(),
            CompletedScreen(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        // 現在のページインデックス
        currentIndex: _screen,
        // onTapでナビゲーションメニューがタップされた時の処理を定義
        onTap: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;

            // ページ遷移を定義。
            // curveで指定できるのは以下
            // https://api.flutter.dev/flutter/animation/Curves-class.html
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        },
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TodoAddPage();
              },
            ),
          );
          if (newListText != null) {
            log('a');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
