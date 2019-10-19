import 'package:flutter/material.dart';

import 'components/timer/timer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          textTheme: TextTheme(title: TextStyle(fontSize: 26)),
          title: Text("Productivity Timer"),
        ),
        body: TimerWidget());
  }
}
