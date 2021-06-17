import 'package:flutter/material.dart';

class WeatherImageContainer extends StatelessWidget {
  final int weatherCondition;
  final String dayOrNight;
  WeatherImageContainer(
      {required this.weatherCondition, required this.dayOrNight});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double _imageHeight;
    if (screenSize.height > 750) {
      _imageHeight = screenSize.height / 2.65;
    } else {
      _imageHeight = screenSize.height / 3.2;
    }
    return Container(
      height: _imageHeight,
      child: Image.asset(weatherImageSelector()),
    );
  }

  String weatherImageSelector() {
    if (weatherCondition == 800) {
      return dayOrNight.endsWith('n')
          ? 'assets/images/weather/12.png'
          : 'assets/images/weather/4.png';
    } else if (weatherCondition == 701 ||
        weatherCondition == 721 ||
        weatherCondition == 741) {
      return 'assets/images/weather/13.png';
    } else if (weatherCondition < 300) {
      return 'assets/images/weather/5.png';
    } else if (weatherCondition < 600) {
      return 'assets/images/weather/8.png';
    } else if (weatherCondition < 700) {
      return 'assets/images/weather/6.png';
    } else if (weatherCondition < 800) {
      return 'assets/images/weather/9.png';
    } else if (weatherCondition < 900) {
      return 'assets/images/weather/3.png';
    } else {
      return 'assets/images/weather/1.png';
    }
  }
}
