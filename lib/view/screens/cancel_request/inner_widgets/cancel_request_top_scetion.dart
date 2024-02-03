import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_controller/cancel_request_controller.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../../utils/app_icons.dart';

class CancelRequestTopSection extends StatefulWidget {
  final int index;
  const CancelRequestTopSection({required this.index, super.key});
  
  @override
  State<CancelRequestTopSection> createState() => _CancelRequestTopSectionState();
}

class _CancelRequestTopSectionState extends State<CancelRequestTopSection> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<RentHistoryController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: AppColors.whiteLight,
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
        child: Column(
          children: [
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteDArkHover,
                    image:  controller.rentUser[widget.index].carId?.image != null ? DecorationImage(
                        image: NetworkImage(controller.rentUser[widget.index].carId?.image![0] ?? ""),
                        fit: BoxFit.fill
                    ) : const DecorationImage(
                        image: AssetImage(AppImages.carImage),
                        fit: BoxFit.fill
                    )
                )
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: controller.rentUser[widget.index].carId?.carModelName ?? "---",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlueColor,
                        right: 8,
                      ),
                      const Row(
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.starIcon,
                            size: 12,),
                          CustomText(
                            text: '(4.5)',
                            fontSize: 10,
                            color: AppColors.blackNormal,
                            left: 8,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CustomImage(imageSrc: AppIcons.lucidFuel, size: 14),
                          CustomText(
                            text: '${controller.rentUser[widget.index].carId?.totalRun ?? "---"}/L',
                            fontSize: 14,
                            color: AppColors.whiteDarkActive,
                            right: 12,
                            left: 6,
                          ),
                        ],
                      ),
                      CustomText(
                        text: '\$${controller.rentUser[widget.index].carId?.hourlyRate ?? "---"} /hour',
                        fontSize: 14,
                        color: AppColors.whiteDarkActive,
                        left: 8,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
