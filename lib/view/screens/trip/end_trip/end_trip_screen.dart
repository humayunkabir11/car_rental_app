import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/screens/trip/end_trip/inner_widgets/top_upload_scetion.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_nav_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'inner_widgets/bottom_info_scetion.dart';

class EndTripScreen extends StatefulWidget {
  const EndTripScreen({super.key});

  @override
  State<EndTripScreen> createState() => _EndTripScreenState();
}

class _EndTripScreenState extends State<EndTripScreen> {
  int? index;
  @override
  void initState() {
    index = Get.arguments;
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.screenUtils();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            appBarContent: Row(
          children: [
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Get.offAllNamed(AppRoute.homeScreen);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: AppColors.blackNormal,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            CustomText(
                text: AppStrings.endTrip.tr,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.blackNormal)
          ],
        )),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // top Section with upload button
                  const EndTripAddCarImage(),
                  const SizedBox(
                    height: 24,
                  ),
                  BottomInfoScetion(
                    index: index ?? 0,
                  )
                ],
              ),
            );
          },
        ),
        bottomNavigationBar:
            GetBuilder<RentHistoryController>(builder: (controller) {
          return BottomNavButton(
              onTap: () {
                if (controller.firstImg == null ||
                    controller.secondImg == null ||
                    controller.thirdImg == null) {
                  AppUtils.successToastMessage("please select 3 images".tr);
                } else {
                  controller.addCarMultipleFilesAndParams1(
                      controller.rentUser[index ?? 0].id ?? "");
                }
              },
              buttonName: AppStrings.endTrip.tr,
              buttonColor: AppColors.primaryColor);
        }),
      ),
    );
  }
}
