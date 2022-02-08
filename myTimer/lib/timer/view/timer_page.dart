import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ticker.dart';
import '../bloc/timer_bloc.dart';
import '../widgets/widgets.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade500,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('My Timer'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TimerModeText(),
            const TimerToggleSwitch(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: [
                  IncreaseButtons(),
                  const TimerText(),
                  DecreaseButtons(),
                  const LapList(),
                ],
              ),
            ),
            const ActionButtons(),
          ],
        ),
      ),
    );
  }
}

class LapList extends StatelessWidget {
  const LapList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) =>
          current.timerMode == TimerMode.stopwatch,
      builder: (context, state) {
        if (state.timerMode == TimerMode.timer) {
          return Container();
        } else {
          return SizedBox(
            height: state.lapList.isEmpty ? 0 : 150.0,
            child: ListView.builder(
              itemCount: state.lapList.length,
              itemBuilder: ((context, index) {
                return Center(
                  child: Text(
                    '$index - ${state.lapList[index]}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 24.0),
                  ),
                );
              }),
            ),
          );
        }
      },
    );
  }
}
