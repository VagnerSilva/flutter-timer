import 'package:flutter/material.dart';
import 'package:timer/app/pages/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(
            button: TextStyle(fontSize: 16),
          )),
      home: HomeModule(),
    );
  }
}
