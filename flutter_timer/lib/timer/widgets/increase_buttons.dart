import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';

class IncreaseButtons extends StatelessWidget {
  IncreaseButtons({Key? key}) : super(key: key);
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) => Visibility(
        visible: state is TimerInitial && state.timerMode == TimerMode.timer
            ? true
            : false,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // * Increment Minutes
            GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                context
                    .read<TimerBloc>()
                    .add(const TimerIncrease(increaseDuration: 6000));
              },
              onLongPressStart: (LongPressStartDetails longPressStartDetails) {
                Feedback.forTap(context);
                timer =
                    Timer.periodic(const Duration(milliseconds: 125), (timer) {
                  context
                      .read<TimerBloc>()
                      .add(const TimerIncrease(increaseDuration: 6000));
                });
              },
              onLongPressEnd: (LongPressEndDetails longPressEndDetails) {
                timer?.cancel();
              },
              onTapCancel: () {
                timer?.cancel();
              },
              child: const Icon(
                Icons.expand_less,
                size: 32.0,
              ),
            ),
            const SizedBox(
              width: 45.0,
            ),
            // * Increment Seconds
            GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                context
                    .read<TimerBloc>()
                    .add(const TimerIncrease(increaseDuration: 100));
              },
              onLongPressStart: (LongPressStartDetails longPressStartDetails) {
                Feedback.forTap(context);
                timer =
                    Timer.periodic(const Duration(milliseconds: 125), (timer) {
                  context
                      .read<TimerBloc>()
                      .add(const TimerIncrease(increaseDuration: 100));
                });
              },
              onLongPressEnd: (LongPressEndDetails longPressEndDetails) {
                timer?.cancel();
              },
              onTapCancel: () {
                timer?.cancel();
              },
              child: const Icon(
                Icons.expand_less,
                size: 32.0,
              ),
            ),
            const SizedBox(
              width: 45.0,
            ),
            // * Increment MilliSeconds
            GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                context
                    .read<TimerBloc>()
                    .add(const TimerIncrease(increaseDuration: 1));
              },
              onLongPressStart: (LongPressStartDetails longPressStartDetails) {
                Feedback.forTap(context);
                timer =
                    Timer.periodic(const Duration(milliseconds: 1), (timer) {
                  context
                      .read<TimerBloc>()
                      .add(const TimerIncrease(increaseDuration: 1));
                });
              },
              onLongPressEnd: (LongPressEndDetails longPressEndDetails) {
                timer?.cancel();
              },
              onTapCancel: () {
                timer?.cancel();
              },
              child: const Icon(
                Icons.expand_less,
                size: 32.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
