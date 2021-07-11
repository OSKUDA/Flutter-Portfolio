import 'package:flutter/material.dart';
import 'package:my_group/utils/constants.dart';

class CustomNoItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: kCardBackgroundColor,
        shadowColor: kTextFieldShadowColor,
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Empty List\nTap the \'+\' icon \nto create or join a group',
            style: TextStyle(
              fontSize: 34.0,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
