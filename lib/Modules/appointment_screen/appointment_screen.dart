import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../app_const/Utils.dart';
import '../../app_const/app_button.dart';
import '../../app_const/app_colors.dart';
import '../../app_const/app_text.dart';
import '../../services/pref_sevice.dart';
import '../dash_board_screen/dash_board_controller.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  // DateFormat dateFormat = DateFormat("MMMM-dd-yyyy");
  String currentDate = DateFormat.yMEd().format(DateTime.now());

// Assuming selectedDate is the DateTime object you want to format

// Example output: formattedDate will be '7/26/2024' for '2024-07-26 00:00:00.000'
  // String currentDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  final DashBoardController dashBoardCtrl = Get.find();
  @override
  Widget build(BuildContext context) {
    // currentDates =  DateFormat("yyyy-MM-dd").format(DateTime.now()) as DateTime;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GetBuilder<DashBoardController>(builder: (logic) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.25,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40.0,
                          color: AppColors.primaryColor.withOpacity(0.7),
                        )
                      ],
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 50.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                // maxRadius: 20.0,
                                backgroundImage: const AssetImage(
                                    "assets/images/profie_pic.jpg"),
                                radius: Get.height * 0.07,
                              ),
                              Utility.uiSizedBix(0, 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Dr.Zeel Soni",
                                    textStyle: context.textTheme.titleMedium!
                                        .copyWith(color: AppColors.whiteColor),
                                  ),
                                  Utility.uiSizedBix(05, 0),
                                  AppText(
                                    title: "MBBS , DNB (Nuclear Medicine)",
                                    textStyle: context.textTheme.titleSmall!
                                        .copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.8)),
                                  ),
                                  Utility.uiSizedBix(10, 0),
                                  CommonButton(
                                      backgroundColor: AppColors.whiteColor,
                                      height: 40,
                                      width: Get.width * 0.35,
                                      text: "View Profile",
                                      onPressed: () {
                                        dashBoardCtrl.currentIndex.value = 2;
                                        dashBoardCtrl.update();
                                      },
                                      textStyle: context.textTheme.titleSmall!
                                          .copyWith(
                                              color: AppColors.primaryColor),
                                      isBoxShadow: true)
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Utility.uiSizedBix(10, 0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                            height: Get.height * 0.06,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.primaryColor,
                            ),
                            child: Center(
                                child: AppText(
                                    title: "< Clinic Visit Slotes >",
                                    textStyle: context.textTheme.titleMedium
                                        ?.copyWith(
                                            color: AppColors.whiteColor)))),
                        Utility.uiSizedBix(10, 0),
                        const TextScroll(
                          'This is the sample text for Flutter TextScroll widget.ample text for Flutter TextScroll  ',
                          mode: TextScrollMode.endless,
                          velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                          delayBefore: Duration(milliseconds: 500),
                          // numberOfReps: 5,
                          // pauseBetween: Duration(milliseconds: 50),
                          style: TextStyle(color: Colors.green),
                          textAlign: TextAlign.right,
                          selectable: true,
                        ),
                        EasyDateTimeLine(
                          initialDate: DateTime.now(),
                          onDateChange: (DateTime selectedDate) {
                            String formattedDate =
                                DateFormat.yMEd().format(selectedDate);
                            currentDate = formattedDate;
                            dashBoardCtrl.update();
                            logger.d("Selected Date => $currentDate");
                          },
                          activeColor: AppColors.primaryColor,
                          headerProps: const EasyHeaderProps(
                            monthPickerType: MonthPickerType.switcher,
                            dateFormatter: DateFormatter.fullDateDayAsStrMY(),
                          ),
                          dayProps: const EasyDayProps(
                            activeDayStyle: DayStyle(
                              borderRadius: 32.0,
                            ),
                            inactiveDayStyle: DayStyle(
                              borderRadius: 32.0,
                            ),
                          ),
                          timeLineProps: const EasyTimeLineProps(
                            hPadding: 16.0, // padding from left and right
                            separatorPadding: 16.0, // padding between days
                          ),
                        ),
                        Utility.uiSizedBix(10, 0),
                        Card(
                          child: Container(
                              height: Get.height * 0.06,
                              // width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: AppColors.primaryColor)
                                  // color: AppColors.primaryColor,
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                      title: " Appointment Selected Date :",
                                      textStyle: context.textTheme.titleSmall),
                                  AppText(
                                      title: "$currentDate",
                                      textStyle: context.textTheme.titleSmall
                                          ?.copyWith(
                                              color: AppColors.primaryColor)),
                                ],
                              )),
                        ),
                        Utility.uiSizedBix(10, 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.newspaper,
                              color: AppColors.primaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: AppText(
                                  title: "Appointment Time",
                                  textStyle: context.textTheme.titleMedium
                                      ?.copyWith(
                                          color: AppColors.primaryColor)),
                            ),
                          ],
                        ),
                        Utility.uiSizedBix(10, 0),
                        Wrap(
                          children: List.generate(
                            dashBoardCtrl.timingList.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    logger.d(
                                        "selected Time => ${dashBoardCtrl.timingList[index].time}");
                                    dashBoardCtrl.selectedTime = index;
                                    dashBoardCtrl.update();
                                    if (dashBoardCtrl
                                        .timingList[index].isTimeSelected) {
                                      Get.snackbar(
                                        snackPosition: SnackPosition.TOP,
                                        colorText: AppColors.primaryColor,
                                        backgroundColor: AppColors.whiteColor,
                                        "Booking SuccessFully",
                                        "",
                                        titleText: Text("Slot AlReady Booked",
                                            style: Get.textTheme.titleMedium
                                                ?.copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      );
                                    } else {
                                      _showDeleteAccountDialog(context, index);
                                    }
                                  },
                                  child: Container(
                                    height: Get.width * 0.1,
                                    width: Get.width * 0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: AppColors.primaryColor),
                                        color: dashBoardCtrl.timingList[index]
                                                .isTimeSelected
                                            ? AppColors.primaryColor
                                            : dashBoardCtrl.selectedTime ==
                                                    index
                                                ? AppColors.primaryColor
                                                : AppColors.whiteColor),
                                    child: Center(
                                        child: Text(
                                      dashBoardCtrl.timingList[index].time,
                                      style: context.textTheme.titleSmall
                                          ?.copyWith(
                                              color: dashBoardCtrl
                                                      .timingList[index]
                                                      .isTimeSelected
                                                  ? AppColors.whiteColor
                                                  : dashBoardCtrl
                                                              .selectedTime ==
                                                          index
                                                      ? AppColors.whiteColor
                                                      : AppColors.blackColor),
                                    )),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String currentDateTime =
            "$currentDate  ${dashBoardCtrl.timingList[index].time}";
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
          title: Text(
            'Are You Sure To Book Appointment ',
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.blackColor.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                currentDateTime,
                style: context.textTheme.titleSmall,
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CommonButton(
                  text: 'Book',
                  width: 100,
                  height: 40,
                  backgroundColor: AppColors.primaryColor,
                  textStyle: context.textTheme.titleMedium
                      ?.copyWith(fontSize: 12, color: AppColors.whiteColor),
                  // borderColor: AppColors.blackColor,
                  onPressed: () async {
                    dashBoardCtrl.timingList[index].isTimeSelected = true;
                    await prefs.setValue(
                        key: 'selectedDateTime', value: currentDateTime);
                    final String? selectDATESS =
                        prefs.getValue(key: 'selectedDateTime');
                    logger.d("preference get Time==> $selectDATESS");
                    Get.back();
                    Get.snackbar(
                      snackPosition: SnackPosition.TOP,
                      colorText: AppColors.primaryColor,
                      backgroundColor: AppColors.whiteColor,
                      "Booking SuccessFully",
                      "",
                      titleText: Text("Booking SuccessFully",
                          style: Get.textTheme.titleMedium?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold)),
                    );
                    dashBoardCtrl.currentIndex.value = 0; // Dismiss the dialog
                  },
                  isBoxShadow: false,
                ),
                CommonButton(
                  text: 'Cancle',
                  height: 40,
                  width: 100,
                  borderColor: AppColors.redColor,
                  backgroundColor: AppColors.redColor,
                  textStyle: context.textTheme.titleMedium
                      ?.copyWith(color: AppColors.whiteColor, fontSize: 12),
                  onPressed: () {
                    Get.back();

                    // Navigator.of(context).pushAndRemoveUntil(
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen()),
                    //   (Route<dynamic> route) => false,
                    // );
                  },
                  isBoxShadow: false,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
