import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';

class DecreaseButtons extends StatelessWidget {
  DecreaseButtons({Key? key}) : super(key: key);
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) => Visibility(
        visible: state is TimerInitial && state.timerMode == TimerMode.timer
            ? true
            : false,
        maintainState: true,
        maintainAnimation: true,
        maintainSize: true,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // * Decrement Minutes
            GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                context
                    .read<TimerBloc>()
                    .add(const TimerDecrease(decreaseDuration: 6000));
              },
              onLongPressStart: (LongPressStartDetails longPressStartDetails) {
                Feedback.forTap(context);
                timer =
                    Timer.periodic(const Duration(milliseconds: 125), (timer) {
                  context
                      .read<TimerBloc>()
                      .add(const TimerDecrease(decreaseDuration: 6000));
                });
              },
              onLongPressEnd: (LongPressEndDetails longPressEndDetails) {
                timer?.cancel();
              },
              onTapCancel: () {
                timer?.cancel();
              },
              child: const Icon(
                Icons.expand_more,
                size: 32.0,
              ),
            ),
            const SizedBox(
              width: 45.0,
            ),
            // * Decrement Seconds
            GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                context
                    .read<TimerBloc>()
                    .add(const TimerDecrease(decreaseDuration: 100));
              },
              onLongPressStart: (LongPressStartDetails longPressStartDetails) {
                Feedback.forTap(context);
                timer =
                    Timer.periodic(const Duration(milliseconds: 125), (timer) {
                  context
                      .read<TimerBloc>()
                      .add(const TimerDecrease(decreaseDuration: 100));
                });
              },
              onLongPressEnd: (LongPressEndDetails longPressEndDetails) {
                timer?.cancel();
              },
              onTapCancel: () {
                timer?.cancel();
              },
              child: const Icon(
                Icons.expand_more,
                size: 32.0,
              ),
            ),
            const SizedBox(
              width: 45.0,
            ),
            // * Decrement MilliSeconds
            GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                context
                    .read<TimerBloc>()
                    .add(const TimerDecrease(decreaseDuration: 1));
              },
              onLongPressStart: (LongPressStartDetails longPressStartDetails) {
                Feedback.forTap(context);
                timer =
                    Timer.periodic(const Duration(milliseconds: 1), (timer) {
                  context
                      .read<TimerBloc>()
                      .add(const TimerDecrease(decreaseDuration: 1));
                });
              },
              onLongPressEnd: (LongPressEndDetails longPressEndDetails) {
                timer?.cancel();
              },
              onTapCancel: () {
                timer?.cancel();
              },
              child: const Icon(
                Icons.expand_more,
                size: 32.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
