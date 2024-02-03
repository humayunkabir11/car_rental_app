import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';


class SignUpAuthSection extends StatefulWidget {
  const SignUpAuthSection({super.key});

  @override
  State<SignUpAuthSection> createState() => _SignUpAuthSectionState();
}

class _SignUpAuthSectionState extends State<SignUpAuthSection> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Full name And TextField
            CustomText(text: "Full Name".tr, bottom: 12),
            CustomTextField(
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return AppStrings.notBeEmpty.tr;
                }
                return null;
              },
              textEditingController: controller.fullNameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              hintText: "Enter your full name".tr,
              inputTextStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackNormal),
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteNormalActive),
            ),
            CustomText(text: AppStrings.email.tr, top: 16, bottom: 12),
            CustomTextField(
              textEditingController: controller.emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              inputTextStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackNormal),
              hintText: "Enter your email".tr,
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
            CustomText(text: AppStrings.gender.tr, top: 16, bottom: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  controller.genderList.length,
                  (index) => GestureDetector(
                        onTap: () => controller.changeGender(index),
                        child: Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              padding: const EdgeInsetsDirectional.all(0.5),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: AppColors.blackNormal
                                          .withOpacity(0.2)),
                                  shape: BoxShape.circle),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: index == controller.selectedGender
                                        ? AppColors.darkBlueColor
                                        : Colors.transparent,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              controller.genderList[index].tr,
                              style: GoogleFonts.poppins(
                                  color: AppColors.blackNormal,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )),
            ),
            CustomText(text: AppStrings.dateOfBirth.tr, top: 16, bottom: 12),
            CustomTextField(
              hintText: "YYYY-MM-DD".tr,
              readOnly: true,
              textEditingController: controller.dateOfBirthController,
              textInputAction: TextInputAction.next,
              inputTextStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.blackNormal,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.notBeEmpty.tr;
                }  else {
                  return null;
                }
              },
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),

              onTap: ()=>controller.dateOfBirthPicker(context),
            ),



            //Password Text and TextField
            CustomText(text: AppStrings.password.tr, bottom: 12, top: 16),
            CustomTextField(
              isPassword: true,
              hintText: "Enter your password".tr,
              keyboardType: TextInputType.visiblePassword,
              textEditingController: controller.passwordController,
              textInputAction: TextInputAction.next,
              inputTextStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.blackNormal,
              ),
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
            CustomText(
                text: AppStrings.confirmPassword.tr, bottom: 12, top: 16),
            CustomTextField(
              isPassword: true,
              textInputAction: TextInputAction.done,
              hintText: "Enter confirm password".tr,
              keyboardType: TextInputType.visiblePassword,
              textEditingController: controller.confirmPasswordController,
              inputTextStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.blackNormal,
              ),
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
                } else if (controller.passwordController.text !=
                    controller.confirmPasswordController.text) {
                  return "Doesn't match password".tr;
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 24),
            CustomElevatedButton(
                buttonWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setDataToLocalStore(controller,
                        fullName: controller.fullNameController.text,
                        email: controller.emailController.text,
                        gender: controller.genderList[controller.selectedGender].toString(),
                        dob: controller.dateOfBirthController.text,
                        password: controller.confirmPasswordController.text);

                    Get.toNamed(AppRoute.signUpContinueScreen);
                  }
                },
                titleText: "Continue".tr)
          ],
        ),
      ),
    );
  }

  setDataToLocalStore(SignUpController signUpController,
      {required String fullName,
      required String email,
      required String gender,
      required String dob,
      required String password}) async {
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.fullName, fullName);
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.email, email);
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.gender, gender);
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.dob, dob);
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.password, password);

    print("full name: $fullName");
    print("email: $email");
    print("gender: $gender");
    print("dob: $dob");
    print("password: $password");
  }
}


