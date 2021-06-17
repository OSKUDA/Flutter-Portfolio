import 'package:flutter/material.dart';
import 'package:my_weather_app/components/NavBarIcons.dart';
import 'package:my_weather_app/util/constants.dart';
import 'package:my_weather_app/screens/splash_screen.dart';
import 'package:my_weather_app/components/CustomSizedBox.dart';

class CitySelectionScreen extends StatefulWidget {
  @override
  _CitySelectionScreenState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  String userInputData = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: NavBarIcon(
                    iconData: Icons.arrow_back_ios_rounded,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: TextField(
                    autofillHints: [AutofillHints.addressCity],
                    style: kCityTextSelectionTextStyle,
                    decoration: kTextFieldInputDecoration,
                    onChanged: (String text) {
                      userInputData = text;
                    },
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xAA242d57),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return SplashScreen(
                        weatherMode: 'city',
                        cityQuery: userInputData,
                      );
                    }), (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'MontserratRegular',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavBarIcon(
                  iconData: Icons.home,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CustomSizedBox(height: 0.0, width: 25.0),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
