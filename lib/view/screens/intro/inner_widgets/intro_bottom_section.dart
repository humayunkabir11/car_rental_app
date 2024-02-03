import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_screen.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroBottomSection extends StatefulWidget {
  const IntroBottomSection({super.key});

  @override
  State<IntroBottomSection> createState() => _IntroBottomSectionState();
}

class _IntroBottomSectionState extends State<IntroBottomSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.selectLanguageScreen);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: "English".tr,
                color: AppColors.whiteLight,
                fontSize: 16,
                right: 8,
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.whiteLight,
                size: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        CustomElevatedButton(
          onPressed: () async {
            //     final SharedPreferences prefes  = await SharedPreferences.getInstance();
            //     String token1  =  prefes.getString(SharedPreferenceHelper.accessTokenKey) ?? "";

            //     if(token1.isNotEmpty){
            //       Get.toNamed(AppRoute.homeScreen);
            //       print("=====================accessTokenKey$token1");
            //     }
            //  else {
            //       Get.toNamed(AppRoute.signInScreen);
            //       print("=====================token$token1");
            //     }
            Get.toNamed(AppRoute.homeScreen);
          },
          titleText: AppStrings.getStarted.tr,
          buttonWidth: double.maxFinite,
          buttonColor: AppColors.whiteLight,
          titleColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
