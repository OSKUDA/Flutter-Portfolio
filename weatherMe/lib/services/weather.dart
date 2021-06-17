import 'package:my_weather_app/services/location.dart';
import 'package:my_weather_app/services/networking.dart';

const String apiKey = '8e7175001c35720c7b8828ebade73027';
const String exclude = 'minutely,hourly,alerts,daily';
const String units = 'metric';
const String baseUrl = 'https://api.openweathermap.org/data/2.5/';

class WeatherModel {
  bool locationDataSuccess = false;
  bool weatherDataSuccess = false;
  String cityName = '';

  Future<dynamic> getCityWeather(String city) async {
    // don't need location
    locationDataSuccess = true;
    NetworkHelper networkHelper =
        NetworkHelper('${baseUrl}weather?q=$city&units=$units&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    // if weatherData is null, that indicates error in networking
    if (weatherData == null) {
      return;
    } else {
      weatherDataSuccess = true;
      return weatherData;
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();

    if (location.longitude == 0 && location.latitude == 0) {
      // there is some error, so location was not fetched
      // No need to proceed to networking
      return;
    } else {
      locationDataSuccess = true;
      // fetch CityName data
      cityName = location.cityName;
      // location was successfully fetched, proceed to download
      NetworkHelper networkHelper = NetworkHelper(
          '${baseUrl}onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=$exclude&units=$units&appid=$apiKey');
      var weatherData = await networkHelper.getData();
      // if weatherData is null, that indicates error in networking
      if (weatherData == null) {
        return;
      } else {
        weatherDataSuccess = true;
        return weatherData;
      }
    }
  }
}

//https://api.openweathermap.org/data/2.5/onecall?lat=33.4&lon=-94.04&exclude=minutely,hourly,alerts&appid=8e7175001c35720c7b8828ebade73027
//https://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid=8e7175001c35720c7b8828ebade73027
