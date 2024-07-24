import 'package:booking_app/app_const/Utils.dart';
import 'package:booking_app/app_const/app_colors.dart';
import 'package:booking_app/app_const/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/pref_sevice.dart';
import 'dash_board_screen/dash_board_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  final  dashBoardCtrl = Get.put(DashBoardController());
  final String? selectedDateTime = prefs.getValue(key: 'selectedDateTime');
    List<String> emptyList =[];

  @override
  Widget build(BuildContext context) {
    logger.d("build home screen");
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<DashBoardController>(
        builder: (controller) {

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Utility.uiSizedBix(15, 0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: "Hello...!",
                              textStyle: context.textTheme.titleMedium!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            Utility.uiSizedBix(05, 0),
                            AppText(
                              title: "Dr.Zeel Soni...!",
                              textStyle: context.textTheme.titleMedium!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Utility.uiSizedBix(15, 0),
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: _controller,style: context.textTheme.titleSmall,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Search s doctor or health issue...',
                        hintStyle: context.textTheme.titleSmall
                            ?.copyWith(color: AppColors.greyColor),

                        prefixIcon: const Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.redColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.redColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Utility.uiSizedBix(15, 0),
                  SizedBox(
                    height: 120,
                    width: Get.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dashBoardCtrl.healthList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Column(
                            children: [
                              Image.asset(
                                dashBoardCtrl.healthList[index].image,
                                height: 80,
                              ),
                              Text(
                                dashBoardCtrl.healthList[index].title,
                                style: context.textTheme.titleSmall
                                    ?.copyWith(color: AppColors.greyColor),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Utility.uiSizedBix(15, 0),
                  Row(
                    children: [
                      AppText(
                        title: "Appointment Today",
                        textStyle: context.textTheme.titleMedium,
                      ),
                      const Spacer(),
                      AppText(
                        title: "See all",
                        textStyle: context.textTheme.titleMedium
                            ?.copyWith(color: Colors.orange),
                      ),
                    ],
                  ),
                  Utility.uiSizedBix(15, 0),
                  Stack(
                    children: [
                      Container(
                        height: Get.height * 0.2,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 18.0, left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                // maxRadius: 20.0,
                                backgroundImage: const AssetImage(
                                    "assets/images/profie_pic.jpg"),
                                radius: Get.height * 0.04,
                              ),
                              Utility.uiSizedBix(0, 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Client Name",
                                    textStyle: context.textTheme.titleMedium!
                                        .copyWith(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Utility.uiSizedBix(05, 0),
                                  AppText(
                                    title: "Health Issue Description",
                                    textStyle: context.textTheme.titleSmall!
                                        .copyWith(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // top: 50,
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: Get.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.whiteColor.withOpacity(0.8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppText(
                                title: "$selectedDateTime",
                                textStyle: context.textTheme.titleMedium!
                                    .copyWith(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    ));
  }
}
