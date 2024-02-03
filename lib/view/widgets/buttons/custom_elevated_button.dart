import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String titleText;
  final Color titleColor;
  final Color buttonColor;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double? buttonWidth;
  final TextAlign textAlign;
  final bool isBorder;

  const CustomElevatedButton(
      {this.textAlign = TextAlign.center,
        required this.onPressed,
        required this.titleText,
        this.titleColor = AppColors.whiteLight,
        this.buttonColor = AppColors.primaryColor,
        this.titleSize = 18,
        this.buttonRadius = 8,
        this.titleWeight = FontWeight.w600,
        this.buttonHeight = 56,
        this.buttonWidth,
        this.isBorder = false,
        super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
            isBorder ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius),
              side: const BorderSide(color: AppColors.primaryColor)
            ) : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        child: CustomText(
          text: titleText,
          textAlign: textAlign,
          fontSize: titleSize,
          fontWeight: titleWeight,
          color: titleColor,
        ),
      ),
    );
  }
}