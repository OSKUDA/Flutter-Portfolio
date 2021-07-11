import 'package:flutter/material.dart';
import 'package:my_group/utils/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_group/screens/authentication_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: kSplashScreenDelayInSeconds), () {
      Navigator.popAndPushNamed(context, AuthenticationScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'appIcon',
                child: Icon(
                  Icons.group_add_rounded,
                  size: 120.0,
                  color: kIconColor,
                ),
              ),
              Text(
                kAppName,
                style: kAppNameTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              SpinKitSpinningCircle(
                color: kIconColor,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
