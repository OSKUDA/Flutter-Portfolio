part of 'timer_bloc.dart';

enum TimerMode {
  stopwatch,
  timer,
}

abstract class TimerState extends Equatable {
  final int duration;
  final TimerMode timerMode;
  const TimerState({required this.duration, required this.timerMode});

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(int duration, TimerMode timerMode)
      : super(duration: duration, timerMode: timerMode);
  @override
  String toString() =>
      "TimerInitial { duration : $duration, timerMode: $timerMode}";
}

class TimerRunPause extends TimerState {
  const TimerRunPause(int duration, TimerMode timerMode)
      : super(duration: duration, timerMode: timerMode);
  @override
  String toString() =>
      "TimerRunPause { duration : $duration, timerMode: $timerMode}";
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int duration, TimerMode timerMode)
      : super(duration: duration, timerMode: timerMode);
  @override
  String toString() =>
      "TimerRunInProgress { duration : $duration, timerMode: $timerMode}";
}

class TimerRunCompleted extends TimerState {
  const TimerRunCompleted(TimerMode timerMode)
      : super(duration: 0, timerMode: timerMode);
  @override
  String toString() =>
      "TimerRunComplete { duration : $duration, timerMode: $timerMode}";
}
