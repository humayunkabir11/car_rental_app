import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_details/car_details_controller/car_details_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class CarDetailsHostInfoSection extends StatefulWidget {
  const CarDetailsHostInfoSection({super.key});

  @override
  State<CarDetailsHostInfoSection> createState() => _CarDetailsHostInfoSectionState();
}

class _CarDetailsHostInfoSectionState extends State<CarDetailsHostInfoSection> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<CarDetailsController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CustomText(
            text: AppStrings.hostInformation.tr,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.blackNormal,
            top: 24,
            bottom: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.name.tr,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: controller.carDetailsModel.cars?.carOwner?.fullName ?? "",
                    color: AppColors.blackNormal,
                    bottom: 12,
                    right: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: CustomImage(imageSrc: AppIcons.starIcon, size: 12),
                  ),
                  const CustomText(
                    text: "--",
                    color: AppColors.blackNormal,
                    bottom: 12,
                    left: 8,
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.contact.tr,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: controller.carDetailsModel.cars?.carOwner?.phoneNumber ?? "",
                color: AppColors.blackNormal,
                bottom: 12,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.email.tr,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              const SizedBox(width: 24,),
              Flexible(
                child: CustomText(
                  maxLines: 1,overflow: TextOverflow.ellipsis,
                  text: controller.carDetailsModel.cars?.carOwner?.email ?? "",
                  color: AppColors.blackNormal,
                  bottom: 12,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.address.tr,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 24,
              ),
              CustomText(
                text: controller.carDetailsModel.cars?.carOwner?.address!.city ?? "",
                color: AppColors.blackNormal,
                bottom: 24,
              ),
            ],
          ),
        ],
      )
    );
  }
}
