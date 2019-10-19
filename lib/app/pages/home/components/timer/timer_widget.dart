import 'package:flutter/material.dart';
import 'package:timer/app/pages/home/components/timer/timer_bloc.dart';
import 'package:timer/app/pages/home/home_module.dart';

class TimerWidget extends StatelessWidget {
  final TimerBloc myTime = HomeModule.to.bloc<TimerBloc>();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          startButtons(width),
          timer(),
          endButtons(),
        ],
      ),
    );
  }

  Row startButtons(width) {
    final double buttonSize = width / 3 - 5;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: buttonSize,
            child: RaisedButton(
              onPressed: () {
                myTime.start(Duration(minutes: 30));
              },
              child: Text("Work"),
              color: Colors.redAccent,
              textColor: Colors.white,
            )),
        Container(
            width: buttonSize,
            child: RaisedButton(
              onPressed: () {
                myTime.start(Duration(minutes: 5));
              },
              child: Text("Short Break"),
              color: Colors.green[500],
              textColor: Colors.white,
            )),
        Container(
            width: buttonSize,
            child: RaisedButton(
              onPressed: () {
                myTime.start(Duration(minutes: 20));
              },
              child: Text("Long Break"),
              color: Colors.green[800],
              textColor: Colors.white,
            ))
      ],
    );
  }

  Row endButtons() {
    final double buttonSize = 200.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: buttonSize,
            child: RaisedButton(
              onPressed: () {
                myTime.stop();
              },
              child: Text("Stop"),
              color: Colors.redAccent,
              textColor: Colors.white,
            )),
        Container(
            width: buttonSize,
            child: RaisedButton(
              onPressed: () {
                myTime.restart();
              },
              child: Text("Restart"),
              color: Colors.green[500],
              textColor: Colors.white,
            ))
      ],
    );
  }

  Container timer() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 10, color: Colors.green)),
      child: StreamBuilder<Object>(
          initialData: Duration(minutes: 0),
          stream: myTime.outDuration,
          builder: (context, snapshot) {
            return Text(
              myTime.displayTimer(snapshot.data),
              style: TextStyle(
                  height: 4,
                  fontSize: 30,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            );
          }),
    );
  }
}
