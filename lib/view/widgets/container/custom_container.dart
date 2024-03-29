import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';


class CustomContainer extends StatelessWidget {
  const CustomContainer({
     super.key,
     this.height,
     this.marginTop = 20,
     this.radiusTopLeft = 16,
     this.radiusTopRight = 16,
     this.width = double.infinity,
     required this.child
  });

  final double radiusTopLeft;
  final double radiusTopRight;
  final double width;
  final double? height;
  final Widget child;
  final double marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(top: marginTop),
      decoration: BoxDecoration(
        color: AppColors.whiteLight1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusTopLeft),
          topRight: Radius.circular(radiusTopRight),
        ),
      ),
      child: child,
    );
  }
}