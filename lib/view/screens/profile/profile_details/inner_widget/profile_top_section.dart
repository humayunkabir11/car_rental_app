import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/view/screens/profile/edit_profile/edit_profile_controller/edit_profile_controller.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_controller/profile_details_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileController = Get.put(EditProfileController());
    return GetBuilder<ProfileDetailsController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () async {
            editProfileController.nameController.text =
                controller.fullNameController.text;
            editProfileController.numberController.text =
                controller.phoneNumberController.text;
            editProfileController.emailController.text =
                controller.emailController.text;
            editProfileController.addressController.text =
                controller.addressController.text;
            editProfileController.profileImage = controller.profileImage;
            editProfileController.userId = controller.userId;
            Get.toNamed(AppRoute.profileSettingsScreen);
            //   final SharedPreferences prefs = await SharedPreferences.getInstance();
            //   String token = prefs.getString(SharedPreferenceHelper.userIdKey)??"";
            //   if(token.isEmpty){
            //     Get.toNamed(AppRoute.signInScreen);
            //   }
            //   else{
            //
            //   }
            // },
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            margin: const EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 10,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: controller.profileImage.isEmpty
                                ? const DecorationImage(
                                    image: AssetImage("assets/images/user.png"),
                                    fit: BoxFit.fill)
                                : DecorationImage(
                                    image:
                                        NetworkImage(controller.profileImage),
                                    fit: BoxFit.fill)),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: controller.username,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteLight,
                              left: 12,
                            ),
                            CustomText(
                              textAlign: TextAlign.start,
                              text: "+52 ${controller.phoneNumber}",
                              color: AppColors.whiteLight,
                              left: 12,
                              top: 8,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                const CustomImage(
                  imageSrc: AppIcons.editProfileIcon,
                  imageType: ImageType.svg,
                  size: 18,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
