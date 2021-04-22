import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(AnimatedContainerApp());

class AnimatedContainerApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedContainerAppState();
  }
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _heigh = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    Widget container = AnimatedContainer(
      duration: Duration(seconds: 1),
      width: _width,
      height: _heigh,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: _borderRadius,
      ),
      curve: Curves.fastOutSlowIn,
    );
    Widget button = FloatingActionButton(
      onPressed: () {
        setState(() {
          // change shape
          final random = Random();

          _width = random.nextInt(300).toDouble();
          _heigh = random.nextInt(300).toDouble();

          _color = Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1, // opacity
          );

          _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
        });
      },
      child: Icon(Icons.play_arrow),
    );
    return MaterialApp(
      title: 'animated container',
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer Demo'),
        ),
        body: Center(
          child: container,
        ),
        floatingActionButton: button,
      ),
    );
  }
}
