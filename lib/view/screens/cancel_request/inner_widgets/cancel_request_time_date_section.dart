import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/date_converter_helper.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_controller/cancel_request_controller.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class CancelRequestTimeDateSection extends StatelessWidget {

  final int index;
  const CancelRequestTimeDateSection({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RentHistoryController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CustomText(
            text: "Time & Date".tr,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.blackNormal,
            bottom: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: "From".tr,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: DateConverter.isoStringToLocalDateOnly(controller.rentUser[index].startDate.toString()?? "---"),
                color: AppColors.blackNormal,
                bottom: 12,
                right: 8,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: "Until".tr,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: DateConverter.isoStringToLocalDateOnly(controller.rentUser[index].endDate.toString() ?? "---"),
                color: AppColors.blackNormal,
                bottom: 12,
                right: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
