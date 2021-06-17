import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:geocode/geocode.dart';

class Location {
  double latitude = 0.0;
  double longitude = 0.0;
  String cityName = '';

  // constructor to initialize our variables
  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        timeLimit: Duration(seconds: 20),
      );
      latitude = position.latitude;
      longitude = position.longitude;

      // fetch cityName from coordinates
      GeoCode geoCode = GeoCode();

      Address address = await geoCode.reverseGeocoding(
        latitude: latitude,
        longitude: longitude,
      );

      // if address.city returns null, use '' blank string
      cityName = address.city ?? 'CityName Error';

      print('latitude $latitude');
      print('longitude $longitude');
      print('cityName ${address.city}');
    } on GeocodeException {
      cityName = 'Api limit! Wait 5 sec';
    } catch (e) {
      print('exception caught $e');
    }
  }
}
