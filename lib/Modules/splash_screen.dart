
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Routes/app_routes.dart';
import '../app_const/app_colors.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 5),
        () => Get.toNamed(Routes.dashBoardScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Image.asset("assets/images/splash_logo.png"),
      ),
    );
  }
}
