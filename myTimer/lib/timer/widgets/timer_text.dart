import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper.dart';

import '../bloc/timer_bloc.dart';

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: HelperFunction().durationToString(
              context.select((TimerBloc bloc) => bloc.state.duration)),
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
