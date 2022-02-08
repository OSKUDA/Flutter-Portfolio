import 'package:flutter/material.dart';
import 'timer/timer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Timer',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 26, 47, 51),
        colorScheme: const ColorScheme.light(
          secondary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home: const TimerPage(),
    );
  }
}
