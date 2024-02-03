import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';
import '../../../trip_details/make_payment/make_payment_screen.dart';

class SignUpContinueAuthSection extends StatefulWidget {
  const SignUpContinueAuthSection({
    super.key,
  });

  @override
  State<SignUpContinueAuthSection> createState() =>
      _SignUpContinueAuthSectionState();
}

class _SignUpContinueAuthSectionState extends State<SignUpContinueAuthSection> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: AppStrings.phoneNumber.tr, bottom: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.whiteLight,
                      border: Border.all(
                          color: AppColors.whiteDark,
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    child: Row(
                      children: [
                        const CustomImage(
                            imageSrc: AppIcons.flafMaxico,
                            imageType: ImageType.svg,
                            size: 40),
                        CustomText(
                            // text: controller.phoneCode,
                          text: "+52",
                            left: 10,
                            color: AppColors.blackNormal)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.notBeEmpty.tr;
                      }  else {
                        return null;
                      }
                    },
                    maxLength: 10,
                    textEditingController: controller.phoneNumberController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    hintText: AppStrings.enterPhoneNumber.tr,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteNormalActive),
                  ),
                ),
              ],
            ),
            //Address Text and TextField
            CustomText(text: AppStrings.address.tr, top: 16, bottom: 12),
            CustomTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.notBeEmpty.tr;
                } else {
                  return null;
                }
              },
              textEditingController: controller.addressController,
              hintText: AppStrings.enterAddress.tr,
              maxLines: 4,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
            ),
               CustomText(text: AppStrings.creditCardNum.tr, bottom: 12, top: 16),
            CustomTextField(
              /*validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.notBeEmpty.tr;
                }
                else {
                  return null;
                }
              },*/
              maxLength: 19,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CardNumberFormatter()
              ],
              hintText: "XXXX XXXX XXXX XXXX".tr,
              textEditingController: controller.creditCardNumberController,
              keyboardType: TextInputType.number,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
            ),
             CustomText(
                text: AppStrings.expireDate.tr,
                bottom: 12,
                top: 16),
            CustomTextField(
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return AppStrings.notBeEmpty.tr;
              //   }
              //   else {
              //     return null;
              //   }
              // },
              inputFormatters: [CardExpirationFormatter()],
              keyboardType: TextInputType.number,
              hintText: "MM/YY".tr,
              textEditingController: controller.expireDateController,
              maxLength: 5,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
            ),
             CustomText(
                text: "CVV".tr,

                bottom: 12,
                top: 16),
            CustomTextField(
              maxLength: 4,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return AppStrings.notBeEmpty.tr;
              //   }
              //   else {
              //     return null;
              //   }
              // },
              textEditingController: controller.cvvController,
              keyboardType: TextInputType.number,
              hintText: AppStrings.enterCVV.tr,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
            ),
            const SizedBox(height: 24),

            Align(
              child: CustomElevatedButton(
                  buttonWidth: MediaQuery.of(context).size.width,
                  onPressed: () => setDataToLocalStore(controller, phoneNumber: " ${controller.phoneNumberController.text}", address: controller.addressController.text),
                  titleText: "Continue".tr),
            )
          ],
        ),
      ),
    );
  }

  setDataToLocalStore(SignUpController signUpController,
      {required String phoneNumber, required String address}) async {
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.phoneNumber, phoneNumber);
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.address, address);

    print("phone number: $phoneNumber");
    print("address: $address");
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRoute.kycScreen);
    }
  }
}
