import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';

class TimerModeText extends StatelessWidget {
  const TimerModeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
      switch (state.timerMode) {
        case TimerMode.stopwatch:
          return Text(
            'Stopwatch',
            style: Theme.of(context).textTheme.headline2,
          );
        case TimerMode.timer:
          return Text(
            'Timer',
            style: Theme.of(context).textTheme.headline2,
          );
      }
    });
  }
}
