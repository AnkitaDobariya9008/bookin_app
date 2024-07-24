

import 'package:booking_app/Modules/appointment_screen/appointment_screen.dart';
import 'package:get/get.dart';

import '../Modules/dash_board_screen/dashboard_screen.dart';
import '../Modules/home_screen.dart';
import '../Modules/profile_screen/profile_screen.dart';
import '../Modules/splash_screen.dart';
import 'app_routes.dart';

class Pages {
  static List<GetPage> pages = [
    GetPage(name: Routes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: Routes.dashBoardScreen, page: () =>  DashboardScreen()),
    GetPage(name: Routes.homeScreen, page: () =>  HomeScreen()),
    GetPage(name: Routes.profileScreen, page: () =>  ProfileScreen()),
    GetPage(name: Routes.appointmentScreen, page: () =>  AppointmentScreen()),

  ];
}
