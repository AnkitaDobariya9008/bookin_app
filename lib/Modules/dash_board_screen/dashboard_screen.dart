import 'package:booking_app/Modules/appointment_screen/appointment_screen.dart';
import 'package:booking_app/Modules/dash_board_screen/dash_board_controller.dart';
import 'package:booking_app/Modules/home_screen.dart';
import 'package:booking_app/Modules/profile_screen/profile_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_const/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dashBoardCtrl = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          return Container(
            child: dashBoardCtrl.currentIndex.value == 0
                ? const HomeScreen()
                : dashBoardCtrl.currentIndex.value == 1
                    ? const AppointmentScreen()
                    : dashBoardCtrl.currentIndex.value == 2
                        ? ProfileScreen()
                        : Container(),
          );
        }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Obx(() {
            return CustomNavigationBar(
              iconSize: 35.0,
              selectedColor: AppColors.whiteColor,
              unSelectedColor: AppColors.secondaryColor,
              backgroundColor: AppColors.primaryColor,
              borderRadius: const Radius.circular(20.0),
              strokeColor: AppColors.whiteColor,
              opacity: 0.8,
              items: [
                CustomNavigationBarItem(
                  icon: const Icon(Icons.home),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.pending_actions),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.account_circle),
                ),
              ],
              currentIndex: dashBoardCtrl.currentIndex.value,
              onTap: (index) {
                dashBoardCtrl.currentIndex.value = index;
                logger.d("current Index=> ${dashBoardCtrl.currentIndex}");
              },
              isFloating: true,
            );
          }),
        ));
  }
}
