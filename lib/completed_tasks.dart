import 'package:flutter/material.dart';
import 'home.dart';

class CompletedTasks extends StatelessWidget {
  CompletedTasks({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed Tasks"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          //globalKeyを使って他ページから変数を参照する
          itemCount: homePageKey.currentState.completedItems.length,
          itemBuilder: (BuildContext context, int index) {
            if (homePageKey.currentState.completedItems[index] == 'true') {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(homePageKey.currentState.listItems[index]),
                  ),
                  Divider(
                    height: 10.0,
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
