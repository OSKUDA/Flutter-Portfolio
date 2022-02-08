import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';
class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final millisecondsStr = (duration % 100).floor().toString().padLeft(2, '0');
    final secondsStr =
        ((duration / 100) % 60).floor().toString().padLeft(2, '0');
    final minutesStr =
        ((duration / (100 * 60)) % 60).floor().toString().padLeft(2, '0');
    return RichText(
      text: TextSpan(
          text: '$minutesStr:$secondsStr:$millisecondsStr',
          style: Theme.of(context).textTheme.headline2,
          children: [
            TextSpan(
              text: 'ms',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black54),
            ),
          ]),
    );
  }
}