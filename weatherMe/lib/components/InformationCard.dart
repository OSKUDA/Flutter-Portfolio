import 'package:flutter/material.dart';
import 'package:my_weather_app/components/CustomSizedBox.dart';
import 'package:my_weather_app/util/constants.dart';

class InformationCard extends StatelessWidget {
  final String detailKey;
  final String detailValue;
  InformationCard({required this.detailKey, required this.detailValue});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.0,
      height: 110.0,
      child: Card(
        color: Color(0x55242d57),
        elevation: 5.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              detailKey,
              style: kInformationCardDetailKeyTextStyle,
            ),
            CustomSizedBox(height: 15.0, width: 0.0),
            Text(
              detailValue,
              style: kInformationCardDetailValueTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
