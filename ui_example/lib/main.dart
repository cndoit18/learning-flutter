import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ui example',
      home: Scaffold(
        appBar: AppBar(title: Text('ui example'),),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_circle,
                size: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Flutter McFlutter',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    'Experienced App Developer',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '123 Main Street',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '(415) 555-0198',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.accessibility),
              Icon(Icons.timer),
              Icon(Icons.phone_android),
              Icon(Icons.phone_iphone),
            ],
          ),
        ),
      ]);
}
