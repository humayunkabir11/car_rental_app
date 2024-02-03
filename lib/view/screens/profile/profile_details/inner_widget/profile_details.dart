import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_controller/profile_details_controller.dart';
import 'package:renti_user/view/widgets/container/custom_container_card.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ProfileDetailsController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainerCard(
              pleft: 16,
              ptop: 8,
              pbottom: 10,
              bottom: 8,
              radius: 8,
              color: AppColors.whiteLight,
              cardContent:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomImage(
                    imageSrc: AppIcons.emailIcon,
                    imageType: ImageType.svg,
                    size: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       CustomText(
                        text: "Email".tr,
                        fontSize: 12,
                        color: AppColors.whiteDark,
                        left: 14,
                      ),
                      CustomText(
                        text: controller.email,
                        color: AppColors.blackNormal,
                        left: 14,
                        top: 8,
                      )
                    ],
                  )
                ],
              )
          ),
          CustomContainerCard(
              pleft: 16,
              ptop: 8,
              pbottom: 10,
              bottom: 8,
              radius: 8,
              color: AppColors.whiteLight,
              cardContent:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomImage(
                    imageSrc: AppIcons.birthdayIcon,
                    imageType: ImageType.svg,
                    size: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       CustomText(
                        text: "Date of Birth".tr,
                        fontSize: 12,
                        color: AppColors.whiteDark,
                        left: 14,
                      ),
                      CustomText(
                        text: controller.dob,
                        color: AppColors.blackNormal,
                        left: 14,
                        top: 8,
                      )
                    ],
                  )
                ],
              )
          ),
          CustomContainerCard(
              pleft: 16,
              ptop: 8,
              pbottom: 10,
              bottom: 8,
              radius: 8,
              color: AppColors.whiteLight,
              cardContent:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomImage(
                    imageSrc: AppIcons.phoneIcon,
                    imageType: ImageType.svg,
                    size: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       CustomText(
                        text: "Phone Number".tr,
                        fontSize: 12,
                        color: AppColors.whiteDark,
                        left: 14,
                      ),
                      CustomText(
                        text: "${controller.phoneNumber}",
                        color: AppColors.blackNormal,
                        left: 14,
                        top: 8,
                      )
                    ],
                  )
                ],
              )
          ),
          CustomContainerCard(
              pleft: 16,
              ptop: 8,
              pbottom: 10,
              bottom: 8,
              radius: 8,
              color: AppColors.whiteLight,
              cardContent:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomImage(
                    imageSrc: AppIcons.location,
                    imageType: ImageType.svg,
                    size: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       CustomText(
                        text: "Address".tr,
                        fontSize: 12,
                        color: AppColors.whiteDark,
                        left: 14,
                      ),
                      CustomText(
                        text: controller.address,
                        color: AppColors.blackNormal,
                        left: 14,
                        top: 8,
                      )
                    ],
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
