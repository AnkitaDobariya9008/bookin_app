import 'package:booking_app/Routes/app_pages.dart';
import 'package:booking_app/Routes/app_routes.dart';
import 'package:booking_app/services/pref_sevice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_const/app_theme.dart';

Future<void> main() async {
  await prefs.onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Doctor App',
      theme: AppThemes.lightTheme,
      initialRoute: Routes.splashScreen,
      getPages: Pages.pages,
    );
  }
}
