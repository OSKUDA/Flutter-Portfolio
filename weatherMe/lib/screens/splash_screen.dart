import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_weather_app/services/weather.dart';
import 'package:my_weather_app/components/ErrorMessageContainer.dart';
import 'package:my_weather_app/screens/weather_screen.dart';
import 'package:my_weather_app/util/constants.dart';

/// Splash Screen class
/// Responsible for Location and Network calls
/// Display error message
/// getLocationWeatherData() fetch weatherData via current user location
/// getCityWeatherData() fetch weatherData via cityQuery passed by user
class SplashScreen extends StatefulWidget {
  final String weatherMode;
  final String cityQuery;
  SplashScreen({required this.weatherMode, required this.cityQuery});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // error and locationError flag helps to update UI
  // when there is location or network issue.
  bool error = false;
  bool locationError = false;

  @override
  void initState() {
    super.initState();
    if (widget.weatherMode == 'location') {
      getLocationWeatherData();
    } else {
      getCityWeatherData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Developed by,',
                style: kDevelopedByTextStyle,
              ),
            ),
            Center(
              child: Text(
                'OskuDa',
                style: kDeveloperNameTextStyle,
              ),
            ),
            Visibility(
              visible: error == false ? true : false,
              child: SpinKitFadingFour(
                color: Colors.white,
                size: 100.0,
              ),
            ),
            Center(
              child: Visibility(
                visible: error == false ? false : true,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      error = false;
                      locationError = false;
                    });
                    getLocationWeatherData();
                  },
                  child: ErrorMessageContainer(
                    locationError: locationError,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getCityWeatherData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getCityWeather(widget.cityQuery);
    if (!weatherModel.locationDataSuccess) {
      setState(() {
        error = true;
        locationError = true;
      });
    } else if (!weatherModel.weatherDataSuccess) {
      setState(() {
        error = true;
        locationError = false;
      });
    } else {
      // success in location and weatherData fetch
      // proceed to weatherScreen
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return WeatherScreen(
          cityName: widget.cityQuery,
          weatherData: weatherData,
          isLocationMode: false,
        );
      }), (Route<dynamic> route) => false);
    }
  }

  void getLocationWeatherData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    if (!weatherModel.locationDataSuccess) {
      setState(() {
        error = true;
        locationError = true;
      });
    } else if (!weatherModel.weatherDataSuccess) {
      setState(() {
        error = true;
        locationError = false;
      });
    } else {
      // success in location and weatherData fetch
      // proceed to weatherScreen
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return WeatherScreen(
          cityName: weatherModel.cityName,
          weatherData: weatherData,
          isLocationMode: true,
        );
      }), (Route<dynamic> route) => false);
    }
  }
}
