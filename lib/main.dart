import 'package:flutter/material.dart';

import 'screens/timer/timer.stateful.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Timer',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TimerStatefulWidget(),
    );
  }
}
