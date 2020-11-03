import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TodoList App",
      debugShowCheckedModeBanner: false,
      home: HomePage(key: homePageKey),
    );
  }
}
