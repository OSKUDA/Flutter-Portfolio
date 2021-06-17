import 'package:flutter/material.dart';
import 'package:my_weather_app/util/constants.dart';

class ErrorMessageContainer extends StatelessWidget {
  final bool locationError;

  ErrorMessageContainer({required this.locationError});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        locationError == true
            ? kErrorMessageTextLocation
            : KErrorMessageTextInternet,
        style: kErrorMessageTextStyle,
      ),
      color: kErrorMessageContainerBackgroundColor,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
    );
  }
}
