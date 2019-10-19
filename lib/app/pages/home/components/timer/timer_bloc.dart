import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class TimerBloc extends BlocBase {
  final Duration _tick = Duration(seconds: 1);
  final Duration _timerOff = Duration(minutes: 0, seconds: 0);
  Timer _action;
  Duration _oldDuration;

  StreamController _timeStreamController = StreamController();

  StreamSink get inDuration => _timeStreamController.sink;
  Stream get outDuration => _timeStreamController.stream;

  @override
  void dispose() {
    _timeStreamController.close();
    _action.cancel();
    _action = null;
    super.dispose();
  }

  String displayTimer(Duration duration) {
    return "${duration.inMinutes.toString().padLeft(2, "0")}" +
        ":${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  void start(Duration duration) {
    if (_action != null) {
      _action.cancel();
      _action = null;
    }

    _action = Timer.periodic(_tick, (_) {
      inDuration.add(duration);
      _oldDuration = duration;

      if (duration.compareTo(_timerOff) <= 0) {
        _action.cancel();
        _action = null;
        _oldDuration = null;
        return;
      }
      duration = duration - _tick;
    });
  }

  void restart() {
    if (_action == null) {
      start(_oldDuration - _tick);
    }
  }

  void stop() {
    if (_action != null) {
      _action.cancel();
      _action = null;
    }
  }
}
