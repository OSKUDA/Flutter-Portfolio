part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration, required this.timerMode});
  final int duration;
  final TimerMode timerMode;
  @override
  List<Object> get props => [duration, timerMode];
}

class TimerPaused extends TimerEvent {
  const TimerPaused();
}

class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class TimerTicked extends TimerEvent {
  const TimerTicked({required this.duration});
  final int duration;
  @override
  List<Object> get props => [duration];
}

class TimerIncrease extends TimerEvent {
  const TimerIncrease({required this.increaseDuration});
  final int increaseDuration;
}

class TimerDecrease extends TimerEvent {
  const TimerDecrease({required this.decreaseDuration});
  final int decreaseDuration;
}

class TimerModeToggle extends TimerEvent {
  const TimerModeToggle({required this.timerMode});
  final TimerMode timerMode;
}
