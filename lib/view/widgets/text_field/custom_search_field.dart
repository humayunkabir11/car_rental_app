import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renti_user/utils/app_colors.dart';


class CustomSearchField extends StatelessWidget {
  const CustomSearchField(
      {super.key,
        required this.title,
        required this.hintText,
        required this.suffixSvgicon,
        required this.prefixSvgicon,
        required this.sizeBoxHeight,
        required this.iconHeight,
        required this.iconWidth,
      });

  final String title;
  final String hintText;
  final String suffixSvgicon;
  final String prefixSvgicon;
  final double sizeBoxHeight;
  final double iconHeight;
  final double iconWidth;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title.isEmpty ? " " : title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.blackNormal),
          ),
        ),
        SizedBox(
          height: sizeBoxHeight,
        ),
        TextFormField(

          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE2E2E2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE2E2E2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE2E2E2)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD7263D)),
            ),
            hintText: hintText == '' ? "" : hintText,
            prefixIcon: prefixSvgicon==""?const SizedBox(): SvgPicture.asset(prefixSvgicon,height: iconHeight,width: iconWidth,),
            suffixIcon: suffixSvgicon == ''
                ? const SizedBox()
                : GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    suffixSvgicon,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}