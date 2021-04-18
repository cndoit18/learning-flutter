import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'animate example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: FadeInDemo()),
      ),
    ));

class FadeInDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('images/owl.jpeg',width: 1280,),
        TextButton(
          onPressed: () {
            setState(() {
              opacity = 1;
            });
          },
          child:
              Text('Show details', style: TextStyle(color: Colors.blueAccent)),
        ),
        AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: opacity,
          child: Column(
            children: [
              Text('Type: Owl'),
              Text('Age: 39'),
              Text('Employment: None'),
            ],
          ),
        ),
      ],
    );
  }
}
