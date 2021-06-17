import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double width;
  final double height;
  CustomSizedBox({required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
