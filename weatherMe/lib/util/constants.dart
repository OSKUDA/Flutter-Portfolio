import 'package:flutter/material.dart';

const kDevelopedByTextStyle = TextStyle(
  fontFamily: 'MontserratThin',
  fontSize: 40.0,
  fontWeight: FontWeight.w400,
);
const kDeveloperNameTextStyle = TextStyle(
  fontFamily: 'Pacifico',
  fontSize: 52.0,
  fontWeight: FontWeight.w300,
);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 35.0,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kCityTextSelectionTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'MontserratRegular',
);
const kInformationCardDetailKeyTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'MontserratRegular',
);
const kInformationCardDetailValueTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w200,
  fontFamily: 'MontserratLight',
);
const kDataTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  fontFamily: 'MontserratThin',
);
const kWeatherDescriptionTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
  fontFamily: 'MontserratRegular',
);

const kCityNameTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 32.0,
  fontWeight: FontWeight.w400,
  fontFamily: 'Pacifico',
);
const kErrorMessageTextStyle = TextStyle(
  fontSize: 12.0,
  fontFamily: 'Courier',
  color: Color(0xFF26A0C2),
);
const kErrorMessageContainerBackgroundColor = Color(0x773c446a);
const kErrorMessageTextLocation =
    'We couldn\'t fetch your location\n1) Check if location permission is given\n2) Check if location service is enabled\n3) Retry by tapping on this message';
const KErrorMessageTextInternet =
    'We couldn\'t connect to our server\n1) Check if device has active internet access\n2) Our server maybe down\n3) Retry by tapping on this message';
