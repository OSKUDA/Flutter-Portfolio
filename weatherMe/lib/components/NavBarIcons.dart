import 'package:flutter/material.dart';

class NavBarIcon extends StatelessWidget {
  final IconData iconData;
  final onPressed;
  NavBarIcon({required this.iconData, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: Colors.white60,
        size: 40.0,
      ),
    );
  }
}
