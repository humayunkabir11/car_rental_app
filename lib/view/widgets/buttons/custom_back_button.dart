import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class CustomBack extends StatelessWidget {
  const CustomBack(
      {super.key,
        this.horizontal = 0,
        this.vertical = 0,
        this.text = "",
        this.fontSize = 18,
        this.onTap,
        this.left = 8,
        this.fontWeight = FontWeight.w500,
        this.color = AppColors.whiteLight,
        });

  final double horizontal;
  final double vertical;
  final String text;
  final double fontSize;

  final VoidCallback? onTap;
  final double left;
  final FontWeight fontWeight;
  final Color color;


  @override
  Widget build(BuildContext context) {

    return Container(

      // width: width,
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new, size: fontSize, color: AppColors.whiteLight),),
          CustomText(
            left: left,
            text: text,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ],
      ),
    );
  }
}