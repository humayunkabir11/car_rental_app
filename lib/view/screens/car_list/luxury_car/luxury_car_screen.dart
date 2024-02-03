import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/screens/car_list/luxury_car/inner_widgets/luxury_car_details.dart';
import 'package:renti_user/view/screens/car_list/luxury_car/luxury_car_controller/luxury_car_controller.dart';
import 'package:renti_user/view/screens/car_list/luxury_car/luxury_car_repo/luxury_car_repo.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_model/all_cars_model.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../service/api_service.dart';

class AllCarScreen extends StatefulWidget {
  const AllCarScreen({super.key});
  @override
  State<AllCarScreen> createState() => _AllCarScreenState();
}
class _AllCarScreenState extends State<AllCarScreen> {

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(LuxuryCarRepo(apiService: Get.find()));
    final controller = Get.put(LuxuryCarController(luxuryCarRepo: Get.find()));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialState();
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // AllCarsModel allCarsModel = Get.arguments;
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar:  CustomAppBar(
            appBarContent: Row(
              children: [
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: (){Get.back();}, icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: AppColors.blackNormal,
                ),),
                 CustomText(
                  text: "Luxury Cars".tr,
                  color: AppColors.blackNormal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  left: 14,
                )
              ],
            )),
        body: GetBuilder<LuxuryCarController>(builder: (controller){
          return  const Padding(
            padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 24),
                LuxuryCarDetails()
              ],
            ),
          );
        })
      ),
    );
  }
}