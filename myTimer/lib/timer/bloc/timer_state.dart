part of 'timer_bloc.dart';

enum TimerMode {
  stopwatch,
  timer,
}

abstract class TimerState extends Equatable {
  final int duration;
  final TimerMode timerMode;
  final List<String> lapList;
  const TimerState(
      {required this.duration, required this.timerMode, required this.lapList});

  @override
  List<Object> get props => [duration, timerMode, lapList];
}

class TimerInitial extends TimerState {
  const TimerInitial(int duration, TimerMode timerMode, List<String> lapList)
      : super(duration: duration, timerMode: timerMode, lapList: lapList);
  @override
  String toString() =>
      "TimerInitial { duration : $duration, timerMode: $timerMode}";
}

class TimerRunPause extends TimerState {
  const TimerRunPause(int duration, TimerMode timerMode, List<String> lapList)
      : super(duration: duration, timerMode: timerMode, lapList: lapList);
  @override
  String toString() =>
      "TimerRunPause { duration : $duration, timerMode: $timerMode}";
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(
      int duration, TimerMode timerMode, List<String> lapList)
      : super(duration: duration, timerMode: timerMode, lapList: lapList);
  @override
  String toString() =>
      "TimerRunInProgress { duration : $duration, timerMode: $timerMode}";
}

class TimerRunCompleted extends TimerState {
  const TimerRunCompleted(TimerMode timerMode, List<String> lapList)
      : super(duration: 0, timerMode: timerMode, lapList: lapList);
  @override
  String toString() =>
      "TimerRunComplete { duration : $duration, timerMode: $timerMode}";
}
