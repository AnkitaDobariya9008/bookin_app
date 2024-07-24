import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppText extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final int maxLines;
  const AppText(
      {super.key,
      required this.title,
      required this.textStyle,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: TextAlign.center,
    );
  }
}
