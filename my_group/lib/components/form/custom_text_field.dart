import 'package:flutter/material.dart';
import 'package:my_group/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? textController;
  final Function(String?) callback;
  CustomTextField(
      {required this.labelText,
      required this.hintText,
      this.textController,
      required this.callback});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 30.0,
      ),
      child: TextField(
        controller: textController == null ? null : textController,
        obscureText: labelText == 'Password' ? true : false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: kTextFieldHintColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              borderSide: BorderSide(
                color: kTextFieldBorderColor,
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.25,
              )),
        ),
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        onChanged: callback,
      ),
    );
  }
}
