import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () {
                  context.read<TimerBloc>().add(TimerStarted(
                      duration: state.duration, timerMode: state.timerMode));
                },
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                child: const Icon(Icons.pause),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerPaused()),
              ),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerReset()),
              )
            ],
            if (state is TimerRunPause) ...[
              FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerResumed()),
              ),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerReset()),
              )
            ],
            if (state is TimerRunCompleted) ...[
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerReset()),
              )
            ]
          ],
        );
      },
    );
  }
}
