import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomWord(),
        ),
      ),
    );
  }
}

class RandomWordsState extends State<RandomWord> {
  final List<WordPair> _suggestion = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index.isOdd) {
        return Divider();
      }

      final int i = index ~/ 2;
      if (i >= _suggestion.length) {
        _suggestion.addAll(generateWordPairs().take(10));
      }
      return ListTile(
        title: Text(_suggestion[i].asPascalCase, style: _biggerFont),
      );
    });
  }
}

class RandomWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}
