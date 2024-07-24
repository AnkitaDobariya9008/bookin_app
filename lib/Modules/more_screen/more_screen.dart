import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("More Screen",style: context.textTheme.titleSmall),
      ),
    );
  }
}
