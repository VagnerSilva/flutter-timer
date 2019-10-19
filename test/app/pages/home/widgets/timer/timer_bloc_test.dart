import 'package:flutter_test/flutter_test.dart';
import 'package:timer/app/pages/home/components/timer/timer_bloc.dart';

void main() {
  TimerBloc bloc;

  setUp(() {
    bloc = TimerBloc();
  });

  group('TimerBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<TimerBloc>());
    });
  });
}
