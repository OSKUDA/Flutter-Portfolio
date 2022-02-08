import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const int _duration = 600;
  static const int _maxDuration = 360000;
  static const TimerMode _timerMode = TimerMode.timer;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration, _timerMode)) {
    on<TimerStarted>(_onStarted);
    on<TimerTicked>(_onTicked);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResume);
    on<TimerReset>(_onReset);
    on<TimerIncrease>(_onIncrease);
    on<TimerDecrease>(_onDecrease);
    on<TimerModeToggle>(_onModeToggle);
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(event.duration, event.timerMode));
    _tickerSubscription?.cancel();
    _tickerSubscription = state.timerMode == TimerMode.timer
        ? _ticker
            .downTick(ticks: event.duration)
            .listen((duration) => add(TimerTicked(duration: duration)))
        : _ticker
            .upTick()
            .listen((duration) => add(TimerTicked(duration: duration)));
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    if (state.timerMode == TimerMode.timer) {
      emit(
        event.duration > 0
            ? TimerRunInProgress(event.duration, state.timerMode)
            : TimerRunCompleted(state.timerMode),
      );
    } else {
      emit(event.duration < _maxDuration
          ? TimerRunInProgress(event.duration, state.timerMode)
          : TimerRunCompleted(state.timerMode));
    }
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration, state.timerMode));
    }
  }

  void _onResume(TimerResumed event, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration, state.timerMode));
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    if (state.timerMode == TimerMode.timer) {
      emit(TimerInitial(_duration, state.timerMode));
    } else {
      emit(TimerInitial(0, state.timerMode));
    }
  }

  void _onIncrease(TimerIncrease event, Emitter<TimerState> emit) {
    if (state is TimerInitial) {
      // check for duration overflow i.e. duration > 1hr
      if (!((state.duration + event.increaseDuration) > _maxDuration - 1)) {
        emit(TimerInitial(
            state.duration + event.increaseDuration, state.timerMode));
      }
    }
  }

  void _onDecrease(TimerDecrease event, Emitter<TimerState> emit) {
    if (state is TimerInitial) {
      // check for negative duration
      if (state.duration < event.decreaseDuration) {
        emit(TimerInitial(0, state.timerMode));
      } else {
        emit(TimerInitial(
          state.duration - event.decreaseDuration,
          state.timerMode,
        ));
      }
    }
  }

  void _onModeToggle(TimerModeToggle event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    event.timerMode == TimerMode.timer
        ? emit(const TimerInitial(0, TimerMode.stopwatch))
        : emit(const TimerInitial(_duration, TimerMode.timer));
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
