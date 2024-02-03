import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CustomContainerCard extends StatelessWidget {
  const CustomContainerCard(
      {this.pbottom=0,
      this.ptop=0,
      this.pleft=0,
      this.pright=0,
      this.left=0,
      this.right=0,
      this.top=0,
      this.bottom=0,
      this.color,
      this.radius = 0,
     required this.cardContent,
      super.key});
  final Widget? cardContent;
  final double radius;
  final Color? color;
  final double pbottom;
  final double ptop;
  final double pleft;
  final double pright;
  final double bottom;
  final double top;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(
          bottom: pbottom, top: ptop, left: pleft, right: pright),
      margin:  EdgeInsets.only(
          bottom: bottom, top: top, left: left, right: right),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        shadows: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child:cardContent,
    );
  }
}
