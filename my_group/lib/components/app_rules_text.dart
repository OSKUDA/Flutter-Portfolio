import 'package:flutter/material.dart';
import 'package:my_group/components/form/custom_text_button.dart';
import 'package:my_group/utils/constants.dart';

class AppRulesText extends StatelessWidget {
  final Function() callback;
  AppRulesText({required this.callback});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          kAppName,
          style: kAppNameTextStyle,
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text(
            kAppRules,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16.0,
            ),
          ),
        ),
        CustomTextButton(
          buttonTitle: 'Start',
          callback: callback,
        ),
      ],
    );
  }
}
