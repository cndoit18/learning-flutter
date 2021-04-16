import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWord(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}

class RandomWordsState extends State<RandomWord> {
  final List<WordPair> _suggestion = <WordPair>[];
  final Set<WordPair> _saved = <WordPair>{};
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext ctx) {
                  final Iterable<ListTile> tiles = _saved.map((e) => ListTile(
                        title: Text(
                          e.asPascalCase,
                          style: _biggerFont,
                        ),
                      ));
                  final List<Widget> divided =
                      ListTile.divideTiles(context: ctx, tiles: tiles).toList();
                  return new Scaffold(
                    appBar: AppBar(
                      title: const Text('Saved Suggestions'),
                    ),
                    body: ListView(children: divided),
                  );
                }));
              }),
        ],
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        if (index.isOdd) {
          return Divider();
        }

        final int i = index ~/ 2;
        if (i >= _suggestion.length) {
          _suggestion.addAll(generateWordPairs().take(10));
        }

        final alreadySavesd = _saved.contains(_suggestion[i]);
        return ListTile(
          title: Text(_suggestion[i].asPascalCase, style: _biggerFont),
          trailing: Icon(
            alreadySavesd ? Icons.favorite : Icons.favorite_border,
            color: alreadySavesd ? Colors.red : null,
          ),
          onTap: () {
            setState(() {
              if (alreadySavesd) {
                _saved.remove(_suggestion[i]);
              } else {
                _saved.add(_suggestion[i]);
              }
            });
          },
        );
      }),
    );
  }
}

class RandomWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}
