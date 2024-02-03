import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class KycBodySection extends StatefulWidget {
  const KycBodySection({super.key});

  @override
  State<KycBodySection> createState() => _KycBodySectionState();
}

class _KycBodySectionState extends State<KycBodySection> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        builder: (controller) => SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Upload Driving License".tr,
                        bottom: 12,
                        textAlign: TextAlign.start,
                      ),
                      controller.uploadDrivingLicense == null
                          ? GestureDetector(
                              onTap: () => controller.pickDrivingLicenceFile(),
                              child: Container(
                                height: 115,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xFFCCCCCC)),
                                    borderRadius: BorderRadius.circular(8)),
                                alignment: Alignment.center,
                                child: const CustomImage(
                                    imageSrc: "assets/icons/upload.svg"),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsetsDirectional.only(),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1, color: const Color(0xFFCCCCCC)),
                              ),
                              child:  Container(
                                padding: const EdgeInsetsDirectional.only(end: 12, top: 12),
                                width: MediaQuery.of(context).size.width-60,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        width: 1, color: AppColors.whiteNormalActive),
                                    image: DecorationImage(
                                        image: FileImage(controller.uploadDrivingLicense!),
                                        fit: BoxFit.fill)),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () => controller.removeDrivingLicenceFile(),
                                    child: const Icon(Icons.cancel_outlined,
                                        color: AppColors.redNormal, size: 24),
                                  ),
                                ),

                              ),


                        /*Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [

                                 *//* GestureDetector(
                                    onTap: () =>
                                        controller.removeDrivingLicenceFile(),
                                    child: const Icon(Icons.cancel_outlined,
                                        color: AppColors.redNormal, size: 24),
                                  )*//*
                                ],
                              ),*/
                            ),
                      CustomText(
                        text: "Upload INE/Passport".tr,
                        top: 16,
                        bottom: 12,
                        textAlign: TextAlign.start,
                      ),
                      controller.uploadPassport == null
                          ? GestureDetector(
                              onTap: () => controller.pickPassportFile(),
                              child: Container(
                                height: 115,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xFFCCCCCC)),
                                    borderRadius: BorderRadius.circular(8)),
                                alignment: Alignment.center,
                                child: const CustomImage(
                                    imageSrc: "assets/icons/upload.svg"),
                              ),
                            )
                          : Container(
                        padding: const EdgeInsetsDirectional.only(),
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1, color: const Color(0xFFCCCCCC)),
                        ),
                        child:  Container(
                          padding: const EdgeInsetsDirectional.only(end: 12, top: 12),
                          width: MediaQuery.of(context).size.width-60,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1, color: AppColors.whiteNormalActive),
                              image: DecorationImage(
                                  image: FileImage(controller.uploadPassport!),
                                  fit: BoxFit.fill)),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () => controller.removePassportFile(),
                              child: const Icon(Icons.cancel_outlined,
                                  color: AppColors.redNormal, size: 24),
                            ),
                          ),

                        ),


                        /*Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [

                                 *//* GestureDetector(
                                    onTap: () =>
                                        controller.removeDrivingLicenceFile(),
                                    child: const Icon(Icons.cancel_outlined,
                                        color: AppColors.redNormal, size: 24),
                                  )*//*
                                ],
                              ),*/
                      ),

                      /*Container(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 12),
                              width: MediaQuery.of(context).size.width,
                              height: 52,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1, color: const Color(0xFFCCCCCC)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFD7263D),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                          ),
                                        ),
                                        child: const CustomImage(
                                            imageSrc: "assets/icons/pdf.svg"),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        controller.passportFileName,
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF2E2C2C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        controller.removePassportFile(),
                                    child: const Icon(Icons.cancel_outlined,
                                        color: AppColors.redNormal, size: 24),
                                  )
                                ],
                              ),
                            ),*/
                      CustomText(
                        text: "INE/Passport".tr,
                        top: 16,
                        bottom: 12,
                        textAlign: TextAlign.start,
                      ),
                      Form(
                        key: formKey,
                        child: CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.notBeEmpty.tr;
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          textEditingController: controller.ineNumberController,
                          textInputAction: TextInputAction.done,
                          hintText: "Enter your INE/Passport".tr,
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteNormalActive),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.15,
                  ),
                  CustomElevatedButton(
                      buttonWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        setDataToLocalStore(
                             controller,
                            controller.drivingLicenseFileName,
                            controller.passportFileName,
                            controller.ineNumberController.text);
                      },
                      titleText: "Continue".tr),
                ],
              ),
            ));
  }

  setDataToLocalStore(
      SignUpController controller,
      String drivingLicenseFileName,
      String passportFileName,
      String ineNumber
      ) async {
    if(controller.uploadDrivingLicense == null || controller.uploadPassport == null){
      return AppUtils.errorToastMessage("Select Licence and passport image".tr);
    }
    await controller.signUpRepo.apiService.sharedPreferences.setString(
        SharedPreferenceHelper.drivingLicense, drivingLicenseFileName);
    await controller.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.passport, passportFileName);
    await controller.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.ineNumber, ineNumber);
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRoute.selectPhoto);
    }
  }
}
