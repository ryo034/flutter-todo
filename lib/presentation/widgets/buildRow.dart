import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';

final _biggerFont = TextStyle(fontSize: 18.0);
// Widget _buildRow(WordPair pair) {
//   return new ListTile(
//     title: new Text(
//       pair.asPascalCase,
//       style: _biggerFont,
//     ),
//   );
// }

class BuildRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildRow(WordPair pair) {
      return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    }
  }
}
