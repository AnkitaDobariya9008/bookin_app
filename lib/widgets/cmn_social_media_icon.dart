import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_const/app_colors.dart';

class CmnSocialMediaIcon extends StatelessWidget {
  // final String socialMediaIcon;
  final void Function()? onTap;
  final Icon icon;
  const CmnSocialMediaIcon(
      {super.key,
      // required this.socialMediaIcon,
      this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.05,
        width: Get.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
