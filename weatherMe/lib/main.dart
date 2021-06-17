import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  //
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF0c1645), // set navigation bar color
    ),
  );
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  // root widget of App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0c1645),
      ),
      // call SplashScreen widget with location mode by default
      home: SplashScreen(
        weatherMode: 'location',
        cityQuery: '',
      ),
    );
  }
}
