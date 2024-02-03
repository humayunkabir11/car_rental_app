import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';

import '../../../../../utils/app_icons.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../widgets/buttons/custom_elevated_button_with_icon.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class SignInAuth extends StatefulWidget {
  const SignInAuth({super.key});
  @override
  State<SignInAuth> createState() => _SignInAuthState();
}

class _SignInAuthState extends State<SignInAuth> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SignInController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 CustomText(text: AppStrings.email.tr, bottom: 12),
                CustomTextField(
                  hintText: AppStrings.enterEmail.tr,
                  textEditingController: controller.emailController,
                  textInputAction: TextInputAction.next,
                  focusNode: controller.emailFocusNode,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      color: AppColors.whiteNormalActive),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.notBeEmpty.tr;
                    } else if (!value.contains(RegExp('\@'))) {
                      return AppStrings.enterValidEmail.tr;
                    } else {
                      return null;
                    }
                  },
                ),
                 CustomText(
                  text: AppStrings.password.tr,
                  bottom: 12,
                  top: 16,
                ),
                CustomTextField(
                  isPassword: true,
                  textEditingController: controller.passwordController,
                  textInputAction: TextInputAction.done,
                  focusNode: controller.passwordFocusNode,
                  isPrefixIcon: false,
                  hintText:AppStrings.enterPassword.tr,
                  keyboardType: TextInputType.visiblePassword,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      color: AppColors.whiteNormalActive),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.notBeEmpty.tr;
                    } else if (value.length < 6) {
                      return AppStrings.passwordShouldBe.tr;
                    } else {
                      return null;
                    }
                  },
                ),
                GestureDetector(
                  onTap: () {
                      Get.toNamed(AppRoute.forgotPasswordScreen);
                  },
                  child:   Align(
                    alignment: Alignment.bottomRight,
                    child: CustomText(
                      text: AppStrings.forgetPassword.tr,
                      fontSize: 16,
                      color: AppColors.darkBlueColor,
                      bottom: 24,
                      top: 16,
                    ),
                  ),
                ),

                controller.isSubmit ? const CustomElevatedLoadingButton() : CustomElevatedButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      controller.signInUser();

                    }

                  },
                  titleText: AppStrings.signIn.tr,
                  buttonWidth: double.maxFinite,
                ),
              ],
            ),
          ),
          //  Align(
          //   alignment: Alignment.center,
          //   child: CustomText(
          //     text: "Or".tr,
          //     top: 24,
          //     bottom: 24,
          //     fontSize: 16,
          //   ),
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: CustomElevatedButtonWithIcon(
          //         onPressed: () {},
          //         titleText: AppStrings.google,
          //         iconSrc: AppIcons.googleIcon,
          //         imageType: ImageType.svg,
          //       ),
          //     ),
          //     const SizedBox(width: 16),
          //     Expanded(
          //       child: CustomElevatedButtonWithIcon(
          //         onPressed: () {},
          //         titleText: AppStrings.apple,
          //         iconSrc: AppIcons.appleIcon,
          //         imageType: ImageType.svg,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}