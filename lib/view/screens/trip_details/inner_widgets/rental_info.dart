import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';

class RentalInfo extends StatelessWidget {

  final int index;
  const RentalInfo({required this.index, super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RentHistoryController>(builder: (controller){
      return Column(
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
                text: controller.rentUser[index].carId?.totalRun ?? "---",
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
                text: controller.rentUser[index].carId?.carColor ?? "---",
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
                text: controller.rentUser[index].carId?.carSeats ?? "---",
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
                text: controller.rentUser[index].carId?.gearType ?? "---",
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
              const  Flexible(
                child:  CustomText(
                  maxLines: 1,overflow: TextOverflow.ellipsis,
                  text: "---",
                  color: AppColors.blackNormal,
                ),
              ),
            ],
          ),
        ],
      );

    });
  }
}