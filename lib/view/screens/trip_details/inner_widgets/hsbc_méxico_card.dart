import 'package:flutter/material.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';




class HsbcMexicoCard extends StatelessWidget {
  const HsbcMexicoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
            margin:  const EdgeInsetsDirectional.symmetric(horizontal: 4),
            padding:  const EdgeInsetsDirectional.symmetric(vertical: 16, horizontal: 12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color:AppColors.whiteDark),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
      child:  Row(
        children: [
          CustomImage(
            imageSrc: AppIcons.paymentIcon,
          ),
          SizedBox(width: 16),
          CustomText(
            text: AppStrings.bankMexico,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.blackNormal,
          ),
        ],
      )

    );
  }
}
