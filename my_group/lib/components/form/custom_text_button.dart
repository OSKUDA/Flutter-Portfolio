import 'package:flutter/material.dart';
import 'package:my_group/utils/constants.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonTitle;
  final Function() callback;
  CustomTextButton({required this.buttonTitle, required this.callback});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        side: BorderSide(
          color: kTextFieldBorderColor,
        ),
        elevation: 5.0,
        shadowColor: kTextFieldShadowColor,
      ),
      onPressed: callback,
      child: Text(
        buttonTitle,
        style: TextStyle(
          color: kButtonTextColor,
        ),
      ),
    );
  }
}
