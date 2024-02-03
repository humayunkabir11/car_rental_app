import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';
class HomeFromUntilSection extends StatefulWidget {
  const HomeFromUntilSection({super.key});

  @override
  State<HomeFromUntilSection> createState() => _HomeFromUntilSectionState();
}

class _HomeFromUntilSectionState extends State<HomeFromUntilSection> {
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: AppStrings.from,
                color: AppColors.blackNormal,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 12,),
              SizedBox(
                height: 40,
                child: CustomTextField(
                  textAlign: TextAlign.start,
                  fieldBorderRadius: 4,
                   hintText: AppStrings.enterTime,
                   hintStyle: GoogleFonts.poppins(
                    color: AppColors.whiteDarkActive,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  fillColor: Colors.transparent,
                  isPrefixIcon: true,
                  prefixIconSrc: AppIcons.calenderIcon,
                  prefixIconColor: AppColors.primaryColor,
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: AppStrings.until,
                color: AppColors.blackNormal,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 12,),
              SizedBox(
                height: 40,
                child: CustomTextField(
                  fieldBorderRadius: 4,
                  hintText: AppStrings.enterTime,
                  hintStyle: GoogleFonts.poppins(
                    color: AppColors.whiteDarkActive,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,

                  ),
                  fillColor: Colors.transparent,
                  isPrefixIcon: true,
                  prefixIconSrc: AppIcons.calenderIcon,
                  prefixIconColor: AppColors.primaryColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
