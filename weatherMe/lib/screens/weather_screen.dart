import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/components/CustomSizedBox.dart';
import 'package:my_weather_app/screens/splash_screen.dart';
import 'package:my_weather_app/util/constants.dart';
import 'package:my_weather_app/components/WeatherImageContainer.dart';
import 'package:my_weather_app/components/InformationCard.dart';
import 'package:my_weather_app/components/NavBarIcons.dart';
import 'package:my_weather_app/util/MonthToString.dart';
import 'package:my_weather_app/screens/city_selection_screen.dart';

class WeatherScreen extends StatefulWidget {
  final weatherData;
  final String cityName;
  final bool isLocationMode;
  WeatherScreen(
      {required this.cityName,
      required this.weatherData,
      required this.isLocationMode});
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName = '';
  String currentDate = '';
  int tempValue = 0;
  int feelsLike = 0;
  double windValue = 0.0;
  int humidityValue = 0;
  int pressureValue = 0;
  int visibilityValue = 0;
  int weatherCondition = 0;
  String dayOrNight = '';
  String weatherDescription = '';

  void updateUI(String cityName, dynamic weatherData) {
    setState(() {
      if (weatherData != null && widget.isLocationMode) {
        this.cityName = cityName;
        var date = DateTime.fromMillisecondsSinceEpoch(
            weatherData['current']['dt'] * 1000);
        String? month = MonthToString().convert(date.month);
        currentDate = '$month ${date.day}, ${date.year}';
        weatherCondition = weatherData['current']['weather'][0]['id'];
        dayOrNight = weatherData['current']['weather'][0]['icon'];
        weatherDescription =
            weatherData['current']['weather'][0]['description'];
        // the value from API can be int or double
        // API returns 0, received as int then converted to double
        // API returns 1.05, treated as double
        var visible = weatherData['current']['visibility'];
        visibilityValue = visible is double ? visible.toInt() : visible;
        var pressure = weatherData['current']['pressure'];
        pressureValue = pressure is double ? pressure.toInt() : pressure;
        var temp = weatherData['current']['temp'];
        tempValue = temp is double ? temp.toInt() : temp;
        var humid = weatherData['current']['humidity'];
        humidityValue = humid is double ? humid.toInt() : humid;
        var feels = weatherData['current']['feels_like'];
        feelsLike = feels is double ? feels.toInt() : feels;
        var win = weatherData['current']['wind_speed'];
        windValue = win is int ? win.toDouble() : win;
      } else if (weatherData != null && !widget.isLocationMode) {
        this.cityName = weatherData['name'];
        var date =
            DateTime.fromMillisecondsSinceEpoch(weatherData['dt'] * 1000);
        String? month = MonthToString().convert(date.month);
        currentDate = '$month ${date.day}, ${date.year}';
        weatherCondition = weatherData['weather'][0]['id'];
        dayOrNight = weatherData['weather'][0]['icon'];
        weatherDescription = weatherData['weather'][0]['description'];
        // the value from API can be int or double
        // API returns 0, received as int then converted to double
        // API returns 1.05, treated as double
        var visible = weatherData['visibility'];
        visibilityValue = visible is double ? visible.toInt() : visible;
        var pressure = weatherData['main']['pressure'];
        pressureValue = pressure is double ? pressure.toInt() : pressure;
        var temp = weatherData['main']['temp'];
        tempValue = temp is double ? temp.toInt() : temp;
        var humid = weatherData['main']['humidity'];
        var feels = weatherData['main']['feels_like'];
        feelsLike = feels is double ? feels.toInt() : feels;
        humidityValue = humid is double ? humid.toInt() : humid;
        var win = weatherData['wind']['speed'];
        windValue = win is int ? win.toDouble() : win;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.cityName, widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomSizedBox(height: 10.0, width: double.infinity),
              Center(
                child: Text(
                  cityName,
                  style: kCityNameTextStyle,
                ),
              ),
              CustomSizedBox(height: 10.0, width: double.infinity),
              Center(
                child: Text(
                  currentDate,
                  style: kDataTextStyle,
                ),
              ),
              WeatherImageContainer(
                weatherCondition: weatherCondition,
                dayOrNight: dayOrNight,
              ),
              Center(
                child: Text(
                  weatherDescription,
                  style: kWeatherDescriptionTextStyle,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InformationCard(
                    detailKey: 'Temp',
                    detailValue: '$tempValue°',
                  ),
                  InformationCard(
                    detailKey: 'Wind',
                    detailValue: '${windValue}km/h',
                  ),
                  InformationCard(
                    detailKey: 'Humidity',
                    detailValue: '$humidityValue%',
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
                width: 0.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InformationCard(
                    detailKey: 'Feels Like',
                    detailValue: '$feelsLike°',
                  ),
                  InformationCard(
                    detailKey: 'Pressure',
                    detailValue: '$pressureValue hPa',
                  ),
                  InformationCard(
                    detailKey: 'Visibility',
                    detailValue: '$visibilityValue m',
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavBarIcon(
                iconData: Icons.home,
                onPressed: () {},
              ),
              CustomSizedBox(height: 0.0, width: 10.0),
              NavBarIcon(
                iconData: Icons.near_me,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return SplashScreen(
                      weatherMode: 'location',
                      cityQuery: '',
                    );
                  }), (Route<dynamic> route) => false);
                },
              ),
              CustomSizedBox(height: 0.0, width: 10.0),
              NavBarIcon(
                iconData: Icons.search,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CitySelectionScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
