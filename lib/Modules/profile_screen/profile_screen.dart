import 'package:booking_app/app_const/app_colors.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app_const/Utils.dart';
import '../../app_const/app_button.dart';
import '../../app_const/app_text.dart';
import '../../widgets/cmn_social_media_icon.dart';
import '../dash_board_screen/dash_board_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final DashBoardController dashBoardCtrl = Get.find();
  Future<void> makePhoneCall() async {
    await launchUrl(Uri(
      scheme: 'tel',
      path: "12786286553",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.whiteColor,
            ),
          ),
          title: Text(
            "Profile",
            style: context.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: AppColors.whiteColor,
                child: SizedBox(
                  height: Get.height * 0.4,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Utility.uiSizedBix(15, 0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColors.lightGreenColor,
                            // maxRadius: 20.0,
                            backgroundImage: const AssetImage(
                              "assets/images/profie_pic.jpg",
                            ),
                            radius: Get.height * 0.06,
                          ),
                        ),
                        Utility.uiSizedBix(05, 0),
                        AppText(
                            title: "Dr.Zeel Soni",
                            textStyle: context.textTheme.titleMedium
                                ?.copyWith(color: AppColors.primaryColor)),
                        Utility.uiSizedBix(05, 0),
                        AppText(
                            title: "MBBS , DNB (Nuclear Medicine)",
                            textStyle: context.textTheme.titleSmall?.copyWith(
                                color: AppColors.blackColor.withOpacity(0.6))),
                        Utility.uiSizedBix(10, 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CmnSocialMediaIcon(
                              icon: const Icon(
                                Icons.call,
                                color: AppColors.whiteColor,
                              ),
                              onTap: () {
                                makePhoneCall();
                              },
                            ),
                            Utility.uiSizedBix(0, 10),
                            CmnSocialMediaIcon(
                              icon: const Icon(
                                Icons.video_call,
                                color: AppColors.whiteColor,
                              ),
                              onTap: () {},
                            ),
                            Utility.uiSizedBix(0, 10),
                            CmnSocialMediaIcon(
                              icon: const Icon(
                                Icons.message,
                                color: AppColors.whiteColor,
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                        Utility.uiSizedBix(10, 0),
                        RatingBar(
                          alignment: Alignment.center,
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          onRatingChanged: (value) => debugPrint('$value'),
                          initialRating: 3,
                          maxRating: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: AppColors.whiteColor,
                      child: SizedBox(
                        width: Get.width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: AppText(
                                  title: "Timing",
                                  textStyle: context.textTheme.titleMedium
                                      ?.copyWith(
                                          color: AppColors.primaryColor)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: AppText(
                                  title: "9.00 AM To 6.00 PM",
                                  textStyle: context.textTheme.titleSmall
                                      ?.copyWith(
                                          color: AppColors.blackColor
                                              .withOpacity(0.6))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: AppColors.whiteColor,
                      child: SizedBox(
                        width: Get.width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: AppText(
                                  title: "Fees",
                                  textStyle: context.textTheme.titleMedium
                                      ?.copyWith(
                                          color: AppColors.primaryColor)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: AppText(
                                  title: "Rs. 500/per session",
                                  textStyle: context.textTheme.titleSmall
                                      ?.copyWith(
                                          color: AppColors.blackColor
                                              .withOpacity(0.6))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                color: AppColors.whiteColor,
                child: SizedBox(
                  height: Get.height * 0.2,
                  width: Get.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person,
                              color: AppColors.primaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: AppText(
                                  title: "About Doctor",
                                  textStyle: context.textTheme.titleMedium
                                      ?.copyWith(
                                          color: AppColors.primaryColor)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppText(
                            maxLines: 5,
                            title:
                                "A physician, medical practitioner, medical doctor, or simply doctor is a health professional who practices medicine, which is concerned with promoting, maintaining or restoring health through the study, diagnosis, prognosis and treatment of disease, injury, and other physical and mental impairments",
                            textStyle: context.textTheme.titleSmall?.copyWith(
                                color: AppColors.blackColor.withOpacity(0.6))),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: AppColors.whiteColor,
                child: SizedBox(
                  height: Get.height * 0.12,
                  width: Get.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: AppColors.primaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: AppText(
                                  title: "Address",
                                  textStyle: context.textTheme.titleMedium
                                      ?.copyWith(
                                          color: AppColors.primaryColor)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppText(
                            maxLines: 2,
                            title:
                                "C 201,ShantiNiketan Solitaire,Near Nikol Police Station,Ahmedabad 382350",
                            textStyle: context.textTheme.titleSmall?.copyWith(
                                color: AppColors.blackColor.withOpacity(0.6))),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18.0),
          child: CommonButton(
            text: "Book Appointment",
            onPressed: () {
              dashBoardCtrl.currentIndex.value = 1;
              dashBoardCtrl.update();
            },
            textStyle: context.textTheme.titleMedium
                ?.copyWith(color: AppColors.whiteColor),
            isBoxShadow: false,
          ),
        ),
      ),
    );
  }
}
