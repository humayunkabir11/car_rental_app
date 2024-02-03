import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/date_converter_helper.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
class BottomInfoScetion extends StatefulWidget {
  const BottomInfoScetion({super.key, required this.index});
  final int index;
  @override
  State<BottomInfoScetion> createState() => _BottomInfoScetionState();
}
class _BottomInfoScetionState extends State<BottomInfoScetion> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RentHistoryController>(builder: (controller){
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CustomText(
            text:  AppStrings.rentalInformation.tr,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackNormal,
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.carmodel.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].carId?.carModelName ?? "--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.carColor.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].carId?.carColor ?? "--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.carlicenseno.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].carId?.carLicenseNumber ?? "--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.rentalTime.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].carId?.totalRun ?? "--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.rentalDate.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].carId?.insuranceEndDate ?? "--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 16),
           CustomText(
            text:  AppStrings.hostInformation.tr,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackNormal,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.name.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].hostId?.fullName ?? "",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.ine.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].hostId?.ine ?? "",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),

            ],
          ),
          const SizedBox(height: 8,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: AppStrings.drivingLicenseNo.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              const Text("--",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.pickupLocation.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].hostId?.address?.city??"",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),

            ],
          ),
        ],
      );
    });
  }
}