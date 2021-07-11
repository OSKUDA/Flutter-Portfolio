import 'package:flutter/material.dart';
import 'package:my_group/utils/constants.dart';

class CustomVisibility extends StatelessWidget {
  final String warningText;
  final bool validator;
  CustomVisibility({required this.warningText, required this.validator});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainState: true,
      maintainSize: true,
      maintainAnimation: true,
      visible: !validator,
      child: Text(
        warningText,
        style: TextStyle(
          color: kWarningTextColor,
        ),
      ),
    );
  }
}
