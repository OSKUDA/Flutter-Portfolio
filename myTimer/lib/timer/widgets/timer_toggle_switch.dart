import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';

class TimerToggleSwitch extends StatelessWidget {
  const TimerToggleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Transform.scale(
          scale: 2.0,
          child: Switch(
            activeColor: Colors.blue,
            activeTrackColor: Colors.blue.shade300,
            inactiveTrackColor: Colors.blue.shade300,
            inactiveThumbColor: Colors.blue,
            value: state.timerMode == TimerMode.timer ? true : false,
            onChanged: state is TimerInitial ||
                    state is TimerRunCompleted ||
                    state is TimerRunPause
                ? (bool newValue) {
                    context
                        .read<TimerBloc>()
                        .add(TimerModeToggle());
                  }
                : null,
          ),
        );
      },
    );
  }
}
