import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appointment_screen/appointment_screen.dart';
import '../home_screen.dart';
import '../more_screen/more_screen.dart';

var logger = Logger();

class DashBoardController extends GetxController {

  @override
  void onInit() {
checkAuth();
    super.onInit();
  }
  checkAuth() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

  }
  RxInt currentIndex = 0.obs;
  int? selectedTime;

  bool times = false;
  // int currentIndex = 0;
  List<dynamic> pages = [
    HomeScreen(),
    AppointmentScreen(),
    const MoreScreen(),
    const MoreScreen(),
  ];
  List<TimeModel> timingList = <TimeModel>[
    TimeModel(time: "9.00 AM"),
    TimeModel(time: "9.30 AM"),
    TimeModel(time: "10.00 AM"),
    TimeModel(time: "10.30 AM"),
    TimeModel(time: "11.00 AM"),
    TimeModel(time: "11.30 AM"),
    TimeModel(time: "12.00 AM"),
    TimeModel(time: "3.00 AM"),
    TimeModel(time: "3.30 AM"),
    TimeModel(time: "4.00 AM"),
    TimeModel(time: "4.30 AM"),
    TimeModel(time: "5.00 AM"),
    TimeModel(time: "5.30 AM"),
    TimeModel(time: "6.00 AM"),
  ];

  List<HealthModel> healthList = <HealthModel>[
    HealthModel(title: "covid 19", image: "assets/images/splash_logo.png"),
    HealthModel(title: "Hospital", image: "assets/images/splash_logo.png"),
    HealthModel(title: "Ambulance", image: "assets/images/splash_logo.png"),
    HealthModel(title: "pill", image: "assets/images/splash_logo.png"),
    HealthModel(title: "Laboratory", image: "assets/images/splash_logo.png"),
    HealthModel(title: "MRI", image: "assets/images/splash_logo.png"),
  ];
}

class TimeModel {
  String time;
  bool isTimeSelected;
  TimeModel({this.time = "",this.isTimeSelected= false});
}

class HealthModel {
  String title;
  String image;

  HealthModel({this.title = "", this.image = ""});
}
