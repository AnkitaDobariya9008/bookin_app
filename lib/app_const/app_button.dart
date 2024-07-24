import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final TextStyle? textStyle;
  final BoxShadow? boxShadow;
  final bool isBoxShadow;
  // final int isBorderRadius;
  final   bool loading ;


   CommonButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
    this.backgroundColor = AppColors.primaryColor,
    this.borderColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    required this.textStyle,
    this.boxShadow,
    this.loading = false,
    // this.isBorderRadius =0,
    required this.isBoxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),


        color: backgroundColor,
        boxShadow: isBoxShadow
            ? [
          BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 20),
              blurStyle: BlurStyle.normal)
        ]
            : null,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
          overlayColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
          backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12),

              side: BorderSide(color: borderColor),
            ),
          ),
        ),
        onPressed: onPressed,
        child: AppText(
            title: text,
          textStyle: textStyle

        ),
      ),
    );
  }
}
