import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/socket_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class CancelRequestHostInfo extends StatefulWidget {
  
  final int index;
  final SocketService socketService;

  const CancelRequestHostInfo({required this.index, required this.socketService, super.key});

  @override
  State<CancelRequestHostInfo> createState() => _CancelRequestHostInfoState();
}

class _CancelRequestHostInfoState extends State<CancelRequestHostInfo> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<RentHistoryController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 CustomText(
                  text: AppStrings.hostInformation.tr,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.blackNormal,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.inboxScreen, arguments: [
                        controller.rentHistoryModel.userWiseRent![widget.index].userId!.id,
                        controller.rentHistoryModel.userWiseRent![widget.index].hostId!.fullName,
                      controller.rentHistoryModel.userWiseRent![widget.index].hostId!.image,
                      controller.rentHistoryModel.userWiseRent![widget.index].hostId!.id
                        ]

                    );
                  },
                  child: Container(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 6, vertical: 6),
                    decoration: const BoxDecoration(
                      color: Color(0xffE6E7F4),
                      shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.chat_sharp, size: 18, color: AppColors.primaryColor),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
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
                      text: controller.rentUser[widget.index].hostId?.fullName ?? "---",
                      color: AppColors.blackNormal,
                      bottom: 12,
                      right: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: CustomImage(imageSrc: AppIcons.starIcon, size: 12),
                    ),
                    const CustomText(
                      text: '(4.5)',
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
                  text: controller.rentUser[widget.index].hostId?.phoneNumber ?? "---",
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
                    text: controller.rentUser[widget.index].hostId?.email ?? "---",
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
                  text: controller.rentUser[widget.index].hostId?.address?.city ?? "---",
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

