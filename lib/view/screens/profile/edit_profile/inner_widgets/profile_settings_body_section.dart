import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/profile/edit_profile/edit_profile_controller/edit_profile_controller.dart';
import 'package:renti_user/view/screens/profile/edit_profile/inner_widgets/profile_image_section.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';


class ProfileSettingsBodySection extends StatelessWidget {
  const ProfileSettingsBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      builder: (controller) => Column(
        children: [
          ProfileImageSection(imagePath: controller.profileImage, isEdit: true),
          const SizedBox(height: 16),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 CustomText(text: AppStrings.fullName.tr, bottom: 12),
                CustomTextField(
                  textEditingController: controller.nameController,
                  hintText: AppStrings.typeFullName.tr,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive),
                ),
                  CustomText(
                  text: AppStrings.email.tr,
                  top: 16,
                  bottom: 12,
                ),
                CustomTextField(
                  readOnly: true,
                  textEditingController: controller.emailController,
                  textInputAction: TextInputAction.done,
                  hintText: AppStrings.typeEmail,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      color: AppColors.whiteNormalActive),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.notBeEmpty;
                    } else if (!value.contains(RegExp('\@'))) {
                      return AppStrings.enterValidEmail;
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    const Icon(Icons.error_outline,size: 14,color: AppColors.redNormal),
                    CustomText(text: "Email not changeable".tr,color: AppColors.redNormal,left: 4),
                  ],
                ),

                 CustomText(
                  text: AppStrings.phoneNumber.tr,
                  bottom: 12,
                  top: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.whiteLight,
                          border: Border.all(
                              color: AppColors.whiteDark,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        child:  const Row(
                          children: [
                            CustomImage(
                                imageSrc: AppIcons.flafMaxico,
                                imageType: ImageType.svg,
                                size: 40),
                            CustomText(
                                text: AppStrings.phone,
                                left: 10,
                                color: AppColors.whiteNormalActive)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        textEditingController: controller.numberController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        hintText: AppStrings.enterPhoneNumber,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteNormalActive),
                      ),
                    ),
                  ],
                ),
                CustomText(text: AppStrings.address.tr, top: 16, bottom: 12),
                Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.whiteLight,
                      border: Border.all(
                          color: AppColors.whiteNormalActive,
                          style: BorderStyle.solid,
                          width: 1.0,
                          strokeAlign: 1)),
                  child: CustomTextField(
                    textEditingController: controller.addressController,
                    textInputAction: TextInputAction.done,
                    fieldBorderColor: AppColors.whiteLight,
                    hintText: AppStrings.enterAddress,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteNormalActive),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
