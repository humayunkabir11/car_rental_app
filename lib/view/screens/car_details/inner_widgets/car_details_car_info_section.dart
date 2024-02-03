import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_details/car_details_controller/car_details_controller.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class CarDetailsCarInfoSection extends StatefulWidget {
  const CarDetailsCarInfoSection({super.key});

  @override
  State<CarDetailsCarInfoSection> createState() => _CarDetailsCarInfoSectionState();
}

class _CarDetailsCarInfoSectionState extends State<CarDetailsCarInfoSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarDetailsController>(builder: (controller) {
      return controller.isLoading ? const Center(
        child: CircularProgressIndicator(),) : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CustomText(
            text: AppStrings.carInformation.tr,
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
                text: AppStrings.totalMileage.tr,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: controller.carDetailsModel.cars?.totalRun ?? "",
                color: AppColors.blackNormal,
                bottom: 12,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.color.tr,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: controller.carDetailsModel.cars?.carColor ?? "",
                color: AppColors.blackNormal,
                bottom: 12,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.capacity.tr,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: controller.carDetailsModel.cars?.carSeats ?? "",
                color: AppColors.blackNormal,
                bottom: 12,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.gearType.tr,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: controller.carDetailsModel.cars?.gearType ?? "",
                color: AppColors.blackNormal,
                bottom: 12,
              ),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CustomText(
                  maxLines: 1,overflow: TextOverflow.ellipsis,
                  text: AppStrings.fuelTankCapacity.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteDarkActive,
                ),
              ),
              const SizedBox(width: 24,),
              const Flexible(
                child: CustomText(
                  maxLines: 1,overflow: TextOverflow.ellipsis,
                  text: "---",
                  // text: controller.carDetailsModel.cars!..toString(),
                  color: AppColors.blackNormal,
                ),
              ),
            ],
          ),
        ],
      );
    }
    );
  }
}

