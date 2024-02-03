import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forget_password_controller/forget_password_controller.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forget_password_repo/forget_password_repo.dart';

import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(ForgetPasswordRepo(apiService: Get.find()));
    Get.put(ForgetPasswordController(forgetPasswordRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.authUtils();
    super.dispose();
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.primaryColor,
          appBar: CustomAppBar(
            appBarContent: CustomBack(
              text: AppStrings.forgetPassword.tr,
            ),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                GetBuilder<ForgetPasswordController>(builder: (controller) {
              return CustomContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 24),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppStrings.emailSentTitle.tr,
                        textAlign: TextAlign.start,
                        fontSize: 16,
                        bottom: 24,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          maxRadius: 50,
                          child: CustomImage(
                            imageSrc: AppIcons.emailLogo,
                            imageType: ImageType.svg,
                          ),
                        ),
                      ),
                      CustomText(
                          text: AppStrings.email.tr, top: 24, bottom: 12),
                      Form(
                        key: formKey,
                        child: CustomTextField(
                          hintText: "Enter your email".tr,
                          textEditingController: controller.emailController,
                          textInputAction: TextInputAction.done,
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                              color: AppColors.whiteNormalActive),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.notBeEmpty.tr;
                            } else if (!value.contains(RegExp('@'))) {
                              return AppStrings.enterValidEmail.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          bottomNavigationBar:
              GetBuilder<ForgetPasswordController>(builder: (controller) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: controller.isSubmit
                    ? const CustomElevatedLoadingButton()
                    : CustomElevatedButton(
                        buttonWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.verifyEmail();
                          }
                        },
                        titleText: "Verify Email".tr));
          }),
        ));
  }
}
