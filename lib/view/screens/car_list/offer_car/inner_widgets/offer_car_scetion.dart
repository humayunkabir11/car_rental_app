import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_controller/offer_car_controller.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class OfferCarSection extends StatelessWidget {
  const OfferCarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferCarController>(builder: (controller) {
      return controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: List.generate(
                  controller.offerCarList.length,
                  (index) => Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsetsDirectional.only(start: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.whiteNormalActive, width: 1),
                            color: AppColors.whiteLight,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.whiteNormalActive,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CustomText(
                                          text: controller
                                              .offerCarList[index].carModelName
                                              .toString(),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkBlueColor,
                                        ),
                                        // const SizedBox(
                                        //   width: 8,
                                        // ),
                                        // const CustomImage(imageSrc: AppIcons.starIcon),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const CustomText(
                                          text: "",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackNormal,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const CustomImage(
                                            imageSrc: AppIcons.lucidFuel,
                                            size: 16),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: controller
                                                      .offerCarList[index]
                                                      .totalRun ??
                                                  "---",
                                              color: AppColors.whiteDarkActive,
                                              left: 8,
                                              textAlign: TextAlign.start,
                                            ),
                                            const CustomText(
                                                text: "/L",
                                                color:
                                                    AppColors.whiteDarkActive),
                                            const SizedBox(width: 16),
                                            CustomText(
                                                text:
                                                    "\$${controller.offerCarList[index].hourlyRate ?? "---"}"),
                                            const CustomText(
                                                text: "/hr",
                                                color: AppColors.primaryColor)
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    CustomElevatedButton(
                                      onPressed: () => Get.toNamed(
                                          AppRoute.carDetails,
                                          arguments: controller
                                              .offerCarList[index].id
                                              .toString()),
                                      titleText: AppStrings.seeDetails.tr,
                                      titleWeight: FontWeight.w400,
                                      titleSize: 10,
                                      buttonRadius: 4,
                                      textAlign: TextAlign.center,
                                      buttonHeight: 28,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                  child: Container(
                                    height: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .offerCarList[index].image![0]
                                          .toString()),
                                      fit: BoxFit.fill),
                                ),
                              )),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          top: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                padding: const EdgeInsetsDirectional.symmetric(
                                    vertical: 4, horizontal: 6),
                                decoration: const BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4),
                                    )),
                                child: const CustomText(
                                  textAlign: TextAlign.center,
                                  text: '12%Off',
                                  color: AppColors.whiteLight,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                      ])));
    });
  }
}
