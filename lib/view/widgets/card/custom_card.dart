import 'package:flutter/material.dart';

import 'package:renti_user/utils/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Color cardBgColor;
  final Color cardBorderColor;
  final double elevation;
  final double borderWidth;
  final double borderRadius;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double endPadding;

  final Widget child;

  const CustomCard(
      {this.cardBgColor = AppColors.whiteLight,
        this.cardBorderColor = AppColors.whiteLight1,
        this.elevation = 1,
        this.borderWidth = 1,
        this.borderRadius = 8,
        required this.child,
         this.bottomPadding = 0,
        this.leftPadding = 0,
        this.endPadding = 0,
        super.key,
        this.topPadding =0,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: AppColors.whiteLight,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: cardBorderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: topPadding, bottom: bottomPadding,start: leftPadding,end: endPadding

        ),
        child: child,
      ),
    );
  }
}
